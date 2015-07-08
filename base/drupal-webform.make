core = 7.x

api = 2
projects[drupal][version] = "7.x-dev"

; Basic webform
projects[webform][version] = "4.9"
projects[webform_rules][version] = "1.6"
projects[webform_uuid][version] = "1.1"
projects[webform_fivestar][version] = "1.0"

; Modules: Extra
projects[contact_google_analytics][version] = "1.4"
projects[form_builder][version] = "1.10"

; Mailchimp integration
projects[mailchimp][version] = "3.4"
libraries[mailchimp][download][type] = "get"
libraries[mailchimp][download][url] = "https://bitbucket.org/mailchimp/mailchimp-api-php/get/2.0.6.zip"
libraries[mailchimp][directory_name] = "mailchimp"
libraries[mailchimp][destination] = "libraries"
