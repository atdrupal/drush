; ---------------------
; This make file is for build the code base for API website, like api.drupal.org
; Make this:
; 	drush make project-api www.api
; ---------------------

core = 7.x

api = 2
projects[drupal][version] = "7.x-dev"

; Include base projects
includes[core]         = "base/drupal-core.make"
includes[admin]        = "base/drupal-admin.make"
includes[api]          = "base/drupal-api.make"
includes[performance]  = "base/drupal-performance.make"
includes[themes]       = "base/drupal-theme.make"

; Modules
projects[api][version] = "1.9"
projects[api_webhook][version] = "1.x-dev"
projects[grammar_parser_lib][version] = "2.1"

; Libraries
projects[grammar_parser][type] = library
projects[grammar_parser][download][type] = "get"
projects[grammar_parser][download][url] = "http://ftp.drupal.org/files/projects/grammar_parser-7.x-2.x-dev.tar.gz"
