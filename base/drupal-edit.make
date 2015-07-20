core = 7.x

api = 2
projects[drupal][version] = "7.x-dev"

; Modules
projects[caption_filter][version] = 1.x-dev
projects[ckeditor][version] = "1.16"
projects[diff][version] = "3.2"
projects[imce][version] = "1.9"
projects[image_resize_filter][version] = "1.15"
projects[linkit][version] = "3.3"
projects[markdown][version] = "1.2"
projects[quickedit][version] = "1.1"
projects[quickedit][patch][2320461] = "https://www.drupal.org/files/issues/edit_not_working_with-2320461-13.patch"
projects[quickedit_tab][version] = "1.1"
projects[wysiwyg][version] = "2.x-dev"
projects[wysiwyg_filter][version] = "1.6-rc2"

; Libraries
libraries[json2][download][type] = get
libraries[json2][download][url] = https://raw.github.com/douglascrockford/JSON-js/master/json2.js
libraries[json2][revision] = fc535e9cc8fa78bbf45a85835c830e7f799a5084

libraries[tinymce][download][type] = get
libraries[tinymce][download][url] = http://download.moxiecode.com/tinymce/tinymce_3.5.8.zip
libraries[tinymce][patch][1561882] = http://drupal.org/files/1561882-cirkuit-theme-tinymce-3.5.8.patch

libraries[markitup][download][type] = git
libraries[markitup][download][url] = https://github.com/markitup/1.x.git
libraries[markitup][download][revision] = 2c88c42
libraries[markitup][download][branch] = master
libraries[markitup][patch][1715642] = http://drupal.org/files/1715642-adding-html-set-markitup-editor.patch
