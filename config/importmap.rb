# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin "jquery", to: "https://code.jquery.com/jquery-3.6.4.min.js"
pin "stimulus-use", to: "https://cdn.jsdelivr.net/npm/stimulus-use@0.52.0/dist/index.min.js"
pin "@fortawesome", to: "https://kit.fontawesome.com/b70d0a4224.js"
pin_all_from "app/javascript/controllers", under: "controllers"
