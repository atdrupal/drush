Drush Make
===

Drush make is an extension to drush that can create a ready-to-use drupal site, pulling 
sources from various locations. Drush make does not turn modules on automatically: it 
only assembles Drupal directories.

### How is it useful for us? 

Typically, the way we would install an instance of Drupal would be to copy an existing 
Drupal project, removing anything that's specific to the original project where that 
codebase is from and then reusing it on a new site. This process is not only tedious, 
but it is also prone to error as we might accidentally remove the item that is vital 
for the installation. 

Another way we would install the site is to do a fresh installation of Drupal, and then 
manually install the required modules and libraries. This process is pretty time consuming.

In situations like this where you have a predictable set of steps that you need to go through
in order to build a codebase, it would be great to be able to automate this, and that's what 
Drush Make is for. 

Among drush make's capabilities are:

1. Downloading Drupal core, as well as contrib modules from drupal.org.
2. Checking code out from SVN, git, and bzr repositories.
3. Getting plain .tar.gz and .zip files (particularly useful for libraries that can not be distributed directly with drupal core or modules).
4. Fetching and applying patches.
5. Fetching modules, themes, and installation profiles, but also external libraries.

More info can be found here: http://docs.drush.org/en/master/make/

### How to build a Drupal site with Drush Make

The following instructions assume that the latest version of Drush is already installed 
on the machine.

#### Generating Makefile from an existing Drupal Installation

A makefile is a macro for installing Drupal.  It contains a list of every little piece 
that makes up your site, such as the modules installed, it’s version, the libraries 
needed for that particular module so that you can use this file to replicate the exact 
same setup for your new Drupal instance. 

In order to generate a makefile for your existing drupal site, simply navigate to it’s root directory and issue the following command on your terminal:

    drush make-generate first.make

This creates a Drush makefile called first.make with all the installation info about the existing site.  This is an example of what you will see in a typical generated makefile:

	   ; This file was auto-generated by drush make
	   core = 7.x
	   api = 2 
	   
	   ; Core
	   projects[drupal][version] = "7.34" 
	   
	   ; Modules                                                        
	   projects[ctools][subdir] = "contrib"
	   projects[ctools][version] = "1.6"
	   projects[ctools][patch][]="<url to patch>"
	   projects[captcha][version] = "1.2"
	   projects[ckeditor][version] = "1.16"
	   libraries[colorbox][download][type]=file
	   libraries[colorbox][download][url]=<url to lib>

Refer to the following link for the full example of makefile: dgo.to/1432374
  
Now that our makefile is generated, we can install a Drupal instance with the same setup as the existing site. 

#### Running makefile to automate a Drupal installation

1. Copy the makefile to the root of the folder where you want to install your new drupal instance
2. Enter the following command in your terminal:

        drush make first.make

  Drush will automatically download Drupal core and all your modules. Since Drush make keeps track of project versions so it will download the same versions you had on your old site. Alternatively, you can instruct the make command to download and install the latest versions instead, learn more here: Drush make options
3. In the browser, navigate through the url of your new site and run the installer as you normally would when you install drupal. Ensure that the database is already up. 