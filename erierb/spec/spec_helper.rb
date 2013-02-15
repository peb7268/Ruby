ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
#require 'rspec/rails'
require 'rspec/autorun'
require 'capybara'
require 'capybara/dsl'
require 'capybara/poltergeist'
require 'pry'

Capybara.run_server = false

headless = !!ENV['HEADLESS']
if headless
   Capybara.current_driver = Capybara.javascript_driver = :poltergeist
 else
   Capybara.current_driver = :selenium
end

Capybara.app_host = 'http://localhost'
include Capybara::DSL

RSpec.configure do |config|
   # Use color in STDOUT
  config.color_enabled = true

  # Use color not only in STDOUT but also in pagers and files
  config.tty = true
end