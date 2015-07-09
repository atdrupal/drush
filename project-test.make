core = 7.x

api = 2
projects[drupal][version] = "7.x-dev"

; Incldue all modules, just usefull for testing
includes[admin]       = drupal-admin.make
includes[api]         = drupal-api.make
includes[core]        = drupal-core.make
includes[dev]         = drupal-dev.make
includes[edit]        = drupal-edit.make
includes[fields]      = drupal-fields.make
includes[media]       = drupal-media.make
includes[mobile]      = drupal-mobile.make
includes[page]        = drupal-page-builder.make
includes[performance] = drupal-performance.make
includes[search]      = drupal-search.make
includes[security]    = drupal-security.make
includes[seo]         = drupal-seo.make
includes[socials]     = drupal-socials.make
includes[spam]        = drupal-spam.make
includes[taxonomy]    = drupal-taxonomy.make
includes[theme]       = drupal-theme.make
includes[webform]     = drupal-webform.make
