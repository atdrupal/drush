core = 7.x

api = 2
projects[drupal][version] = "7.x-dev"

projects[media][version] = "2.x-dev"
projects[menu_block][version] = "2.5"
projects[media_vimeo][version] = "2.0"
projects[media_youtube][version] = "2.x-dev"

; Cropping images
projects[manualcrop][version] = 1.x-dev
projects[manualcrop][download][type] = git
projects[manualcrop][download][revision] = 7237972
projects[manualcrop][download][branch] = 7.x-1.x
projects[manualcrop][patch][1665130] = http://drupal.org/files/issues/manualcrop-file_entity-settings-1665130-13.patch
projects[manualcrop][patch][2237835] = http://drupal.org/files/issues/manualcrop-two-crop-tools-2237835.patch
projects[manualcrop][patch][2248587] = http://drupal.org/files/issues/manualcrop-make-file-2248587.patch

; jQuery imagesLoaded
libraries[jquery.imagesloaded][download][type] = file
libraries[jquery.imagesloaded][download][url] = https://github.com/desandro/imagesloaded/archive/v2.1.2.tar.gz
libraries[jquery.imagesloaded][download][subtree] = imagesloaded-2.1.2

; jQuery imgAreaSelect
libraries[jquery.imgareaselect][download][type] = file
libraries[jquery.imgareaselect][download][url] = http://odyniec.net/projects/imgareaselect/jquery.imgareaselect-0.9.10.zip
libraries[jquery.imgareaselect][download][subtree] = jquery.imgareaselect-0.9.10
