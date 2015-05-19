core = 7.x

api = 2
projects[drupal][version] = "7.x-dev"

; Panels
projects[panels][version] = 3.5
projects[panelizer][version] = 3.1
projects[panelizer][patch][1623536] = http://drupal.org/files/issues/array-to-object-on-update-1623536-26.patch
projects[panelizer][patch][2416505] = http://www.drupal.org/files/issues/panelizer-search_api-2416505-3.patch
projects[panels_breadcrumbs][version] = 2.2

; Modules: Easier page builder
projects[fape][version] = 1.2
projects[fieldable_panels_panes][patch][2146479] = http://www.drupal.org/files/issues/2146479-admin-menu-map-conflict.patch
projects[fieldable_panels_panes][patch][2256503] = http://www.drupal.org/files/issues/fieldable_panels_panes-n2256503-12-backport-fpp15.patch
projects[fieldable_panels_panes][patch][2283263] = http://drupal.org/files/issues/fieldable_panels_panes-n2283263-5.patch
projects[fieldable_panels_panes][version] = "1.5"
projects[gridbuilder][version] = "1.x-dev"
projects[pm_existing_pages][version] = "1.4"

; Layouts
projects[layout][version] = "1.x-dev"
projects[radix][version] = "3.0-rc2"
projects[radix_layouts][version] = "3.3"

; Panopoly
projects[panopoly_admin][version] = "1.21"
projects[panopoly_core][version] = "1.21"
projects[panopoly_images][version] = "1.21"
projects[panopoly_magic][version] = "1.21"
projects[panopoly_pages][version] = "1.21"
projects[panopoly_search][version] = "1.21"
projects[panopoly_theme][version] = "1.21"
projects[panopoly_users][version] = "1.21"
projects[panopoly_widgets][version] = "1.21"
projects[panopoly_wysiwyg][version] = "1.21"

; Dependencies
projects[radix_layouts][version] = 3.3
projects[simple_gmap][version] = "1.2"
