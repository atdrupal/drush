core = 7.x

api = 2
projects[drupal][version] = "7.x-dev"

; Incldue base make files
includes[core]         = "drupal.make"

; Custom setup for this project
projects[google_analytics][version] = "2.1"
