require "byebug" if ENV["RACK_ENV"] == "development"
require "pry" if ENV["RACK_ENV"] == "development"

require_relative "app_prototype/container"

AppPrototype::Container.finalize! do |container|
  # Boot the app config before everything else
  container.boot! :config
end

app_paths = Pathname(__FILE__).dirname.join("../apps").realpath.join("*")
Dir[app_paths].each { |f| require "#{f}/core/boot" }

require_relative "app_prototype/application"
