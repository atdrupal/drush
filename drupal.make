core = 7.x

api = 2
projects[drupal][version] = "7.x-dev"

; Incldue base make files
includes[core]         = "drupal-core.make"
includes[admin]        = "drupal-admin.make"
includes[api]          = "drupal-api.make"
includes[dev]          = "drupal-dev.make"
includes[edit]         = "drupal-edit.make"
includes[fields]       = "drupal-fields.make"
includes[mobile]       = "drupal-mobile.make"
includes[performance]  = "drupal-performance.make"
includes[page-builder] = "drupal-page-builder.make"
includes[search]       = "drupal-search.make"
includes[security]     = "drupal-security.make"
includes[seo]          = "drupal-seo.make"
includes[spam]         = "drupal-spam.make"
includes[themes]       = "drupal-theme.make"
includes[webform]      = "drupal-webform.make"
includes[workflow]     = "drupal-workflow.make"
