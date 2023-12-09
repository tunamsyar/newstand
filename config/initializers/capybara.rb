require 'capybara'
require 'capybara/rails'
require 'selenium/webdriver'

Capybara.register_driver :headless_chrome do |app|
  capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(
    chromeoptions: { args: w(headless disable-gpu) }
  )
  Capybara::Selenium::Driver.new app, browser: :chrome, desired_capabilities: capabilities
end

Capybara.default_driver = :headless_chrome
