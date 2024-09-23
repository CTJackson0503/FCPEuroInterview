require 'capybara/cucumber'

Capybara.default_driver = :selenium_chrome

Capybara.app_host = 'http://www.fcpeuro.com'
Capybara.run_server = false