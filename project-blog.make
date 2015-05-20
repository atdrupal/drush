core = 7.x

api = 2
projects[drupal][version] = "7.x-dev"

; Include base projects
includes[api]          = "base/drupal-api.make"
includes[admin]        = "base/drupal-admin.make"
includes[core]         = "base/drupal-core.make"
includes[edit]         = "base/drupal-edit.make"
includes[performance]  = "base/drupal-performance.make"
includes[social]       = "base/drupal-socials.make"
includes[spam]         = "base/drupal-spam.make"
includes[themes]       = "base/drupal-theme.make"
