require "inflecto"

require_relative "main/container"

require "main/application"
require "main/transactions"

Main::Container.configure do |container|
  container.auto_load!(container.root.join("app/persistence/repositories")) do |repo_class|
    -> { Inflecto.constantize(repo_class).new(container["persistence.rom"]) }
  end
end

Dir[Main::Container.root.join("transactions/**/*.rb")].each(&method(:require))
