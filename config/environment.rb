ENV["RACK_ENV"] ||= "development"

APP_ROOT = File.expand_path(File.join(File.dirname(__FILE__), "..")).freeze

$LOAD_PATH.unshift(File.join(APP_ROOT, "lib")) unless $LOAD_PATH.include?(File.join(APP_ROOT, "lib"))

# Require gems in bundle
require "rubygems"
require "bundler/setup"
Bundler.require(:default, ENV["RACK_ENV"].to_sym)

# Cherry pick gems
require "active_support/inflector"
require "active_support/core_ext/object/blank"

# Load environmental config
Dotenv.load

# Require initializers
Dir["#{APP_ROOT}/config/initializers/*.rb"].each do |initializer|
  require initializer
end

# Require local lib files
require "functions"

# Require app files
Dir["#{APP_ROOT}/app/**/*.rb"].each do |file|
  require file
end

# Finalize ROM environment
ROM.finalize.env
