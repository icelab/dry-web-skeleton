AppPrototype::Container.finalize(:config) do |container|
  require "app_prototype/config"
  container.register "config", AppPrototype::Config.load(container.root, "application", container.config.env)
end
