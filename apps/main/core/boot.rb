require_relative "main/container"

Main::Container.finalize! do |container|
  require "main/enqueue"
  container.register(:enqueue, Main::Enqueue.new)

  container.auto_register! "lib/main/persistence/repositories" do |repo_class|
    -> { repo_class.new(container["core.persistence.rom"]) }
  end
end

require "main/application"
require "main/view"
require "main/transactions"

Main::Container.require "transactions/**/*.rb"
