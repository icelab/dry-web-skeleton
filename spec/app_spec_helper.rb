ENV["RACK_ENV"] = "test"

require "capybara/rspec"
require "capybara-screenshot/rspec"
require "database_cleaner"
require "pry-byebug"

Dir[SPEC_ROOT.join("support/*.rb").to_s].each(&method(:require))
Dir[SPEC_ROOT.join("shared/*.rb").to_s].each(&method(:require))

require SPEC_ROOT.join("../core/boot").realpath.to_s


Capybara.app = Main::Application.app
Capybara.save_and_open_page_path = "tmp/capybara-screenshot"

require "database_cleaner"
DatabaseCleaner[:sequel, connection: TestHelpers.db_connection].strategy = :truncation

RSpec.configure do |config|
  config.include TestHelpers
  config.include TestFactories
  config.include TestPageHelpers

  config.before :suite do
    DatabaseCleaner.clean_with :truncation
    Main::Application.freeze
  end

  config.around :each do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end
end
