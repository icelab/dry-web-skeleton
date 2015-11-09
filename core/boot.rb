env = ENV.fetch("RACK_ENV", :development).to_sym

require "logger"
require "rodakase/view"

require_relative "app_prototype/container"

AppPrototype::Container.configure(env) do |container|
  container.register(:logger, Logger.new(container.root.join("log/app.log")))
end

require "app_prototype/application"
require "app_prototype/view"
