// Configure import map in config/importmap.rb. https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

// Import Bootstrap's JavaScript
import * as bootstrap from "bootstrap"
window.bootstrap = bootstrap
