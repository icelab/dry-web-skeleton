require_relative "app_prototype/container"

AppPrototype::Container.finalize! do |container|
  require "logger"
  container.register(:logger, Logger.new(container.root.join("log/app.log")))
end

app_paths = Pathname(__FILE__).dirname.join("../apps").realpath.join("*")
Dir[app_paths].each { |f| require "#{f}/core/boot" }

require_relative "app_prototype/application"
