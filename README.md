## Drush make [![Build Status](https://travis-ci.org/atdrupal/make.svg)](https://travis-ci.org/atdrupal/make)

This project provide base make files for your Drupal projects.

    git clone https://github.com/atdrupal/make.git drupal-make

    # Make new
    drush make --concurrency=5 drupal-make/drupal.make drupal-root

    # Remake
    cd drupal-make
    drush make --concurrency=5 ../drupal-make/drupal.make .