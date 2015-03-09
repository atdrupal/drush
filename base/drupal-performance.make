core = 7.x

api = 2
projects[drupal][version] = "7.x-dev"

projects[blockcache_alter][version] = "1.x-dev"
projects[cdn][version] = "2.6"
projects[entitycache][version] = "1.2"
projects[expire][version] = "2.0-rc4"
projects[memcache][version] = "1.5"
; projects[mongodb][version] = "1.x-dev"
projects[pathcache][version] = "1.x-dev"
projects[purge][version] = "1.x-dev"
projects[queue_mail][version] = "1.3"
projects[redis][version] = "3.2"
projects[views_content_cache][version] = "3.x-dev"

; Amazon webservices
projects[awssdk][version] = "5.x-dev"
projects[amazons3][version] = "1.1"
projects[awssdk][type] = library
projects[awssdk][download][type] = git
projects[awssdk][download][url] = https://github.com/amazonwebservices/aws-sdk-for-php.git
projects[awssdk][download][tag] = "1.6.3"
