require "que"

AppPrototype::Container.namespace :que do |container|
  container.finalize :que do
    container.boot! :logger
    container.boot :rom

    container.register :connection, container["persistence.config"].gateways[:default].connection

    Que.logger = container[:logger]
    Que.mode = :sync if container.config.env == :test
    Que.connection = container["que.connection"]
  end
end
