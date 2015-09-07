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
projects[fieldable_panels_panes][version] = "1.7"
projects[gridbuilder][version] = "1.x-dev"
projects[pm_existing_pages][version] = "1.4"

; Layouts
projects[layout][version] = "1.x-dev"
projects[radix][version] = "3.0-rc4"
projects[radix_layouts][version] = "3.4"

; Panopoly
projects[panopoly_admin][version] = "1.25"
projects[panopoly_core][version] = "1.25"
projects[panopoly_images][version] = "1.25"
projects[panopoly_magic][version] = "1.25"
projects[panopoly_pages][version] = "1.25"
projects[panopoly_search][version] = "1.25"
projects[panopoly_theme][version] = "1.25"
projects[panopoly_users][version] = "1.25"
projects[panopoly_widgets][version] = "1.25"
projects[panopoly_wysiwyg][version] = "1.25"

; Dependencies
projects[simple_gmap][version] = "1.2"

; For manualcrop module
libraries[jquery.imagesloaded][download][type] = get
libraries[jquery.imagesloaded][download][url] = https://github.com/desandro/imagesloaded/archive/v2.1.2.tar.gz
libraries[jquery.imgareaselect][download][type] = get
libraries[jquery.imgareaselect][download][url] = http://odyniec.net/projects/imgareaselect/jquery.imgareaselect-0.9.10.zip
