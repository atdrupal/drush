core = 7.x

api = 2
projects[drupal][version] = "7.x-dev"

; Include base projects
includes[core]         = "drupal-core.make"
includes[admin]        = "drupal-admin.make"
includes[api]          = "drupal-api.make"
includes[performance]  = "drupal-performance.make"
includes[themes]       = "drupal-theme.make"

; Custom setup for this project
projects[restful][version] = "1.x-dev"
prjoects[oauth][version] = "3.2"
projects[restws][version] = "2.3"
projects[services][version] = "3.11"
projects[services_documentation][version] = "1.4"
