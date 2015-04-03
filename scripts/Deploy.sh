#!/bin/bash

# File
# ---------------------
# This script should be called by CI, not manually
#
# CodeShip.com > Project settings > Deployment > Add new "Custom script":
#
#   bash ~/clone/Deploy.sh
#

# Variables
# ---------------------
# $CLONE           - Example: $HOME/clone
# $TARGET_USER     - Example: deployer
# $TARGET_HOST     - Example: example.com
# $TARGET_PORT     - Example: 22
# $TARGET_DIR      - Example: /var/www
# $TARGET_COMPOSER - Example: /usr/local/bin/composer
# $TARGET_DRUSH    - Example: /usr/local/bin/drush
# $DRUPAL_DIR      - Example: /var/www/html
# $SITE_NAME       - Example: default, will be used to find Drupal site dir — $DRUPAL_DIR/sites/$SITE_NAME/settings.php

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

# Fill default values
# ---------------------
if [ -z ${CLONE} ];       then CLONE=${DIR}; fi
if [ -z ${TARGET_PORT} ]; then TARGET_PORT=22; fi
if [ -z ${SITE_DIR} ];    then SITE_DIR=${DRUPAL_DIR}/sites/${SITE_NAME}; fi
if [ -z ${SSH} ];         then SSH=$(which ssh)" $TARGET_USER@$TARGET_HOST -p $TARGET_PORT"; fi

# Execute preDeploy`$GIT_BRANCH`.sh file if it's existing
# ---------------------
if [ ! -z ${CI_BRANCH} ]; then
	DEPLOY_PRE=${CLONE}/preDeploy${CI_BRANCH}.sh
	if [ -f ${DEPLOY_PRE} ]; then
		source ${DEPLOY_PRE};
	fi
fi

# Execute preDeploy.sh file if it's existing
# ---------------------
DEPLOY_PRE=${CLONE}/preDeploy.sh
if [ -f ${DEPLOY_PRE} ]; then
	source ${DEPLOY_PRE};
fi

# Check variables
# ---------------------
DEPLOY_ERROR=0
if [ -z "$TARGET_USER" ];     then DEPLOY_ERROR=1; echo "Missing variable TARGET_USER";     fi
if [ -z "$TARGET_HOST" ];     then DEPLOY_ERROR=1; echo "Missing variable TARGET_HOST";     fi
if [ -z "$TARGET_DIR" ];      then DEPLOY_ERROR=1; echo "Missing variable TARGET_DIR";      fi
if [ -z "$TARGET_COMPOSER" ]; then DEPLOY_ERROR=1; echo "Missing variable TARGET_COMPOSER"; fi
if [ -z "$TARGET_DRUSH" ];    then DEPLOY_ERROR=1; echo "Missing variable TARGET_DRUSH";    fi
if [ -z "$DRUPAL_DIR" ];      then DEPLOY_ERROR=1; echo "Missing variable DRUPAL_DIR";      fi
if [ -z "$SITE_NAME" ];       then DEPLOY_ERROR=1; echo "Missing variable SITE_NAME";       fi
if [ $DEPLOY_ERROR -ge 1 ];   then exit 1; fi

# Custom commands
export PATH="$HOME/bin:$HOME/.composer/vendor/bin:$PATH";

# Install composer & drush
# ---------------------
mkdir -p $HOME/bin $HOME/.composer/vendor/bin;

if [ ! $(which composer) ]; then
	curl -sS https://getcomposer.org/installer | php;
	chmod a+x composer.phar;
	mv composer.phar $HOME/bin/composer;
fi

if [ ! $(which drush) ]; then
	composer global require --prefer-source drush/drush:~7.0.0-alpha9;
fi

# Make the source
# ---------------------
if [ ! -d ${CLONE}/drupal-source ]; then
	drush make ${CLONE}/drupal-site/drupal.make ${CLONE}/drupal-source
fi

# If the backup-migrate module is enabled on Drupal site.
CHECK_BAM=$($SSH "cd $SITE_DIR; $TARGET_DRUSH pml | grep backup_migrate | grep Enabled;");
if [[ $CHECK_BAM == *"backup_migrate"* ]]; then
	# Dump database where we can restore easily if we had problem
	# ---------------------
	$SSH "cd $SITE_DIR; $TARGET_DRUSH bam-backup;"

	# Restore database if we found the command in last git commit:
	# 	git commit -m "#restore $source $destination $backupId"
	# ---------------------
	if [[ $CI_MESSAGE == *"#restore"* ]]; then
		BAM_SOURCE='@TODO'
		BAM_DESTINATION='@TODO'
		BAM_BACKUP_ID='@TODO'
		$SSH "cd $SITE_DIR; $TARGET_DRUSH bam-restore $BAM_SOURCE $BAM_DESTINATION $BAM_BACKUP_ID;"
	fi
fi

# Sync built source code to target
# ---------------------
# Sync Drupal base source code
rsync -Pav --delete ${CLONE}/drupal-source/           $TARGET_USER@$TARGET_HOST:$DRUPAL_DIR/ --exclude=.git/ --exclude=sites/;

# Sync custom pem, modules, themes, libraries, …
$SSH "mkdir -p $SITE_DIR"
$SSH "mkdir -p $SITE_DIR/{modules,themes,libraries,files,private}"
$SSH "chmod a+wr -Rf $SITE_DIR/{files,private}"
rsync -a --delete ${CLONE}/drupal-site/pem/         $TARGET_USER@$TARGET_HOST:$TARGET_DIR/pem/
rsync -a      ${CLONE}/drupal-site/composer.json    $TARGET_USER@$TARGET_HOST:$DRUPAL_DIR/modules/system/composer.json

if [ -e ${CLONE}/drupal-site/settings.php ]; then
	rsync -Pa ${CLONE}/drupal-site/settings.php $TARGET_USER@$TARGET_HOST:$SITE_DIR/settings.php
fi

if [ -e ${CLONE}/drupal-site/local.settings.php ]; then
	rsync -a ${CLONE}/drupal-site/local.settings.php    $TARGET_USER@$TARGET_HOST:$SITE_DIR/local.settings.php
fi

rsync -a --delete ${CLONE}/drupal-site/libraries/   $TARGET_USER@$TARGET_HOST:$SITE_DIR/libraries/
rsync -a --delete ${CLONE}/drupal-site/modules/     $TARGET_USER@$TARGET_HOST:$SITE_DIR/modules/
rsync -a --delete ${CLONE}/drupal-site/themes/      $TARGET_USER@$TARGET_HOST:$SITE_DIR/themes/
rsync -a --delete ${CLONE}/drupal-source/sites/all/ $TARGET_USER@$TARGET_HOST:$DRUPAL_DIR/sites/all/;
rsync -a 		  ${CLONE}/drupal-source/sites/default/ $TARGET_USER@$TARGET_HOST:$DRUPAL_DIR/sites/default/;

# Run Drupal update commands
# ---------------------
# Run composer update on remote server
CHECK_COMPOSER=$($SSH "cd $SITE_DIR; $TARGET_DRUSH pml | grep composer_manager | grep Enabled;");
CHECK_FEATURES=$($SSH "cd $SITE_DIR; $TARGET_DRUSH pml | grep features | grep Enabled;");

# Pre update: Put site offline, and related stuffs
$SSH "cd $SITE_DIR/files/composer/;
  $TARGET_DRUSH vset -y maintenance_mode 1;
  $TARGET_DRUSH vset -y composer_manager_autobuild_file 0;"

# Composer manager is enabled on target, run composer update there.
if [[ $CHECK_COMPOSER == *"composer_manager"* ]]; then
  $SSH "
    cd $SITE_DIR;
    $TARGET_DRUSH composer-json-rebuild;
    mkdir -p $SITE_DIR/files/composer;
    cd $SITE_DIR/files/composer/;
    $TARGET_COMPOSER update --no-dev;"
fi

# Features modules is enabled on target, run features reverting
if [[ $CHECK_FEATURES == *"features"* ]]; then
  $SSH "cd $SITE_DIR; $TARGET_DRUSH features-revert-all -y;"
fi

# Run Drupal update commands, then put the site back to online.
$SSH "
    cd $SITE_DIR;
    $TARGET_DRUSH dl -y registry_rebuild;
    $TARGET_DRUSH rr;
    $TARGET_DRUSH updb -y;
    $TARGET_DRUSH vset maintenance_mode 0;";
