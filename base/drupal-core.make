; A separate durpal-core.make file for core patches.

api = 2
core = 7.x
projects[drupal][type] = core
projects[drupal][version] = 7.34

; CORE PATCHES

; Force settings.php to include local.settings.php
projects[drupal][patch][pull-39] = 'https://github.com/drupal/drupal/pull/39.diff'

; Raise minimum PHP version to work around core requirements check bug.
; Keep eyeballs posted on http://drupal.org/node/1724130.
projects[drupal][patch][1724012] = http://drupal.org/files/drupal-increase-php-version-1724012_0.patch

; Allow install profiles to change the system requirements
; http://drupal.org/node/1772316
projects[drupal][patch][] = "http://drupal.org/files/drupal-7.x-allow_profile_change_sys_req-1772316-21.patch"

; Load multiple revisions at once
projects[drupal][patch][1730874] = http://drupal.org/files/1730874_0.patch

; Registry rebuild should not parse the same file twice in the same request
projects[drupal][patch][1470656] = "http://drupal.org/files/drupal-1470656-14.patch"

; user_role_grant_permissions() throws PDOException when used for a disabled
; module's permission or with non-existent permissions
; http://drupal.org/comment/7285420#comment-7285420
projects[drupal][patch][] = "http://drupal.org/files/drupal-fix_pdoexception_grant_permissions-737816-36-do-not-test.patch"

; image_get_info always populates file_size, even if already set.
projects[drupal][patch][2289493] = "http://drupal.org/files/issues/drupal-2289493-3-image_get_info-filesize-D7.patch"

; Remove all occurences of sourceMappingURL and sourceURL when JS files are aggregated
projects[drupal][patch][2400287] = "http://drupal.org/files/issues/Issue-2400287-by-hass-Remove-JS-source-and-source-map-D7_0.patch"
