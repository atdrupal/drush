## Drush make [![Build Status](https://travis-ci.org/atdrupal/make.svg)](https://travis-ci.org/atdrupal/make)

This project provides base make files for your Drupal projects.

    git clone https://github.com/atdrupal/make.git drupal-make

    # Make new
    drush make --concurrency=5 drupal.make drupal-root

    # Remake
    cd drupal-root
    drush make --concurrency=5 ../drupal.make ./

Check [official documentation](http://www.drush.org/en/master/make/) for Drush make to know what it's, the make file syntax, …
