core = 7.x

api = 2
projects[drupal][version] = "7.x-dev"

; Incldue base make files
includes[core]         = "base/drupal-core.make"
includes[admin]        = "base/drupal-admin.make"
includes[api]          = "base/drupal-api.make"
includes[dev]          = "base/drupal-dev.make"
includes[edit]         = "base/drupal-edit.make"
includes[fields]       = "base/drupal-fields.make"
includes[mobile]       = "base/drupal-mobile.make"
includes[performance]  = "base/drupal-performance.make"
includes[page-builder] = "base/drupal-page-builder.make"
includes[search]       = "base/drupal-search.make"
includes[security]     = "base/drupal-security.make"
includes[seo]          = "base/drupal-seo.make"
includes[spam]         = "base/drupal-spam.make"
includes[themes]       = "base/drupal-theme.make"
includes[webform]      = "base/drupal-webform.make"
includes[workflow]     = "base/drupal-workflow.make"
