require_relative "main/container"

Main::Container.finalize! do |container|
  container.auto_register! "lib/main/persistence/repositories" do |repo_class|
    -> { repo_class.new(container["persistence.rom"]) }
  end
end

require "main/application"
require "main/view"
require "main/transactions"

Main::Container.require "transactions/**/*.rb"
