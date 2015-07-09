core = 7.x

api = 2
projects[drupal][version] = "7.x-dev"

; Incldue all modules, just usefull for testing
includes[admin]       = "base/drupal-admin.make"
includes[api]         = "base/drupal-api.make"
includes[core]        = "base/drupal-core.make"
includes[dev]         = "base/drupal-dev.make"
includes[edit]        = "base/drupal-edit.make"
includes[fields]      = "base/drupal-fields.make"
includes[media]       = "base/drupal-media.make"
includes[mobile]      = "base/drupal-mobile.make"
includes[page]        = "base/drupal-page-builder.make"
includes[performance] = "base/drupal-performance.make"
includes[search]      = "base/drupal-search.make"
includes[security]    = "base/drupal-security.make"
includes[seo]         = "base/drupal-seo.make"
includes[socials]     = "base/drupal-socials.make"
includes[spam]        = "base/drupal-spam.make"
includes[taxonomy]    = "base/drupal-taxonomy.make"
includes[theme]       = "base/drupal-theme.make"
includes[webform]     = "base/drupal-webform.make"
