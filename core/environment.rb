ENV["RACK_ENV"] ||= "development"

# Require gems in bundle
require "rubygems"
require "bundler/setup"
Bundler.require :default, ENV["RACK_ENV"].to_sym

Dotenv.load

# Custom gem requires
require "active_support/inflector"
require "active_support/core_ext/object/blank"

require_relative "application"

# Require initializers
Dir[AppPrototype::Container.config.root.join("core/initializers/*.rb")].each(&method(:require))

# Local lib requires
require "readings/form_attributes"
