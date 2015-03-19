core = 7.x

api = 2
projects[drupal][version] = "7.x-dev"

; ---------------------
; Module we can not live without
; ---------------------
projects[features][version] = "2.3"
projects[apps][patch][2430915] = https://www.drupal.org/files/issues/apps-drush-default-apps-2430915-1.patch
projects[apps][version] = "1.0-beta20"
projects[flag][version] = "3.6"
projects[rules][version] = "2.8"
projects[strongarm][version] = "2.0"

; Mail
projects[mimemail][version] = "1.0-beta3"
projects[smtp][version] = "1.2"

; Form
projects[options_element][version] = "1.12"
projects[select_or_other][version] = "2.20"

; Extra API
projects[context][version] = "3.6"
projects[ctools][version] = "1.7"
projects[ctools][patch][2119357] = http://www.drupal.org/files/issues/2119357-6_0.patch
projects[ctools][patch][2416589] = http://www.drupal.org/files/issues/ctools-illegal-offset-views-add-contextual-links-2416589-1.patch
projects[entity][version] = "1.6"
projects[efq_views][version] = "1.0-alpha5"
projects[remote_entity][version] = "1.0-beta6"
projects[token][version] = "1.6"
projects[transliteration][version] = "3.2"
projects[uuid][version] = "1.0-alpha6"
projects[votingapi][version] = "2.12"

; Modern tech integration
projects[composer_manager][version] = "1.x-dev"
projects[jquery_update][version] = "2.5"
projects[xautoload][version] = "5.1"
projects[libraries][version] = "2.2"

; Performance
projects[elements][version] = "1.x-dev"
projects[elysia_cron][version] = "2.1"

; Views
projects[views][version] = "3.10"
projects[views][patch][2037469] = http://drupal.org/files/views-exposed-sorts-2037469-1.patch

; Views: Extras
projects[radix_views][version] = "1.x-dev"
projects[views_autocomplete_filters][version] = 1.1
projects[views_autocomplete_filters][patch][2277453] = http://drupal.org/files/issues/ViewsAutocompleteFilters-no_results_on_some_environments-2277453-1.patch
projects[views_autocomplete_filters][patch][2317351] = http://www.drupal.org/files/issues/views_autocomplete_filters-content-pane-2317351-4.patch
projects[views_autocomplete_filters][patch][2374709] = http://www.drupal.org/files/issues/views_autocomplete_filters-cache-2374709-2.patch
projects[views_bulk_operations][version] = 3.2
projects[views_bulk_operations][patch][2192775] = http://drupal.org/files/issues/views-bulk-operations-2192775-1_0.patch
