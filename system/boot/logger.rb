AppPrototype::Container.finalize :logger do |container|
  require "logger"
  container.register :logger, Logger.new(container.root.join("log/#{container.config.env}.log"))
end
