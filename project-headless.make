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
projects[restws][version] = "2.4"
projects[services][version] = "3.12"
projects[services_documentation][version] = "1.4"
projects[services_entity][version] = "2.0-alpha8"
projects[services_entity][patch][2302661] = "https://www.drupal.org/files/issues/services_entity-operation_in_property_field_condition-2302661-5.patch"
