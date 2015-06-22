core = 7.x

api = 2
projects[drupal][version] = "7.x-dev"

; Modules: Admin
projects[advanced_help][version] = "1.3"
projects[backup_migrate][version] = "3.0"
projects[date_popup_authored][version] = "1.1"
projects[module_filter][version] = "2.0"
projects[navbar][version] = "1.6"
projects[save_draft][version] = 1.4

; Libraries
libraries[ckeditor][download][type] = get
libraries[ckeditor][download][url] = http://download.cksource.com/CKEditor%20for%20Drupal/edit/ckeditor_4.3.2_edit.zip

libraries[modernizr][download][type] = git
libraries[modernizr][download][url] = https://github.com/BrianGilbert/modernizer-navbar.git
libraries[modernizr][download][revision] = 5b89d9225320e88588f1cdc43b8b1e373fa4c60f

libraries[backbone][download][type] = get
libraries[backbone][download][url] = https://github.com/jashkenas/backbone/archive/1.1.2.tar.gz

libraries[underscore][download][type] = get
libraries[underscore][download][url] = https://github.com/jashkenas/underscore/archive/1.8.2.tar.gz
