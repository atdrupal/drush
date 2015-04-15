core = 7.x

api = 2
projects[drupal][version] = "7.x-dev"

; Include base projects
includes[core]         = "base/drupal-core.make"
includes[admin]        = "base/drupal-admin.make"
includes[api]          = "base/drupal-api.make"
includes[performance]  = "base/drupal-performance.make"
includes[themes]       = "base/drupal-theme.make"

; Custom setup for this project
projects[restful][version] = "1.x-dev"
prjoects[oauth][version] = "3.2"
projects[restws][version] = "2.3"
projects[services][version] = "3.12"
projects[services_documentation][version] = "1.4"
