require_relative "db_helper"

require "rack/test"
require "capybara/rspec"
require "capybara-screenshot/rspec"
require "capybara/poltergeist"

Dir[SPEC_ROOT.join("support/app/*.rb").to_s].each(&method(:require))
Dir[SPEC_ROOT.join("shared/app/*.rb").to_s].each(&method(:require))

require SPEC_ROOT.join("../core/boot").realpath

Capybara.app = Main::Application.app
Capybara.app_host = "http://localhost"
Capybara.save_and_open_page_path = "#{File.dirname(__FILE__)}/../tmp/capybara-screenshot"
Capybara.javascript_driver = :poltergeist
Capybara::Screenshot.prune_strategy = {keep: 10}

RSpec.configure do |config|
  config.include TestPageHelpers
  config.include Rack::Test::Methods, type: :request
  config.include Rack::Test::Methods, Capybara::DSL, type: :feature

  config.before :suite do
    Main::Application.freeze
  end
end
