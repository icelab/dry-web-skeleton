ENV["RACK_ENV"] = "test"

require "capybara/rspec"
require "capybara-screenshot/rspec"
require_relative "../core/environment"

# Load support files
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each(&method(:require))

Capybara.app = AppPrototype::Application.freeze.app
Capybara.save_and_open_page_path = "tmp/capybara-screenshot"

RSpec.configure do |config|
  config.include TestHelpers
  config.include TestFactories
  config.include TestPageHelpers

  config.before :suite do
    DatabaseCleaner[:sequel, connection: TestHelpers.db_connection].strategy = :transaction
    DatabaseCleaner.clean_with :truncation
  end

  config.around :each do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end
end
