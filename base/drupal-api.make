core = 7.x

api = 2
projects[drupal][version] = "7.x-dev"

; ---------------------
; Module we can not live without
; ---------------------
projects[apps][version] = "1.0"
projects[defaultcontent][version] = 1.0-alpha9
projects[defaultcontent][patch][1754428] = http://drupal.org/files/1754428-allow-node-export-alter.patch
projects[defaultcontent][patch][1757782] = http://drupal.org/files/1757782-cannot-import-menu-hierarchy-8.patch
projects[distro_update][version] = 1.0-beta4
projects[features][version] = "2.6"
projects[features_override][version] = 2.0-rc3
projects[flag][version] = "3.7"
projects[json2][version] = "1.1"
projects[message][version] = "1.10"
projects[rules][version] = "2.9"
projects[strongarm][version] = "2.0"

; Mail
projects[mimemail][version] = "1.0-beta4"
projects[smtp][version] = "1.3"

; Form
projects[entityreference_prepopulate][version] = "1.5"
projects[options_element][version] = "1.12"
projects[prepopulate][version] = "2.0"
projects[select_or_other][version] = "2.22"

; Extra API
projects[context][version] = "3.6"
projects[ctools][version] = "1.9"
projects[eck][version] = "2.0-rc7"
projects[efq_views][version] = "1.0-alpha5"
projects[entity][version] = "1.6"
projects[og][version] = "2.7"
projects[profile2][version] = "1.x-dev"
projects[remote_entity][version] = "1.0-beta6"
projects[reply][version] = "2.0-alpha1"
projects[token][version] = "1.6"
projects[transliteration][version] = "3.2"
projects[uuid][version] = "1.0-alpha6"
projects[votingapi][version] = "2.12"

; Modern tech integration
projects[composer_manager][version] = "1.x-dev"
projects[jquery_update][version] = "2.6"
projects[xautoload][version] = "5.2"
projects[libraries][version] = "2.2"
projects[gd_react][download][type] = "git"
projects[gd_react][download][url] = "http://git.drupal.org/project/gd_react.git"
projects[gd_react][download][branch] = "7.x-1.x"

; Performance
projects[elements][version] = "1.x-dev"
projects[elysia_cron][version] = "2.1"

; Views
projects[views][version] = "3.11"
projects[views][patch][2037469] = http://drupal.org/files/views-exposed-sorts-2037469-1.patch

; Views: Extras
projects[radix_views][version] = "1.x-dev"
projects[views_autocomplete_filters][version] = "1.2"
projects[views_autocomplete_filters][patch][2317351] = "http://www.drupal.org/files/issues/views_autocomplete_filters-content-pane-2317351-4.patch"
projects[views_autocomplete_filters][patch][2374709] = "http://www.drupal.org/files/issues/views_autocomplete_filters-cache-2374709-2.patch"
projects[views_bulk_operations][version] = "3.3"
projects[views_datasource][version] = "1.0-alpha2"
