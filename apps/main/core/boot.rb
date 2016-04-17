require_relative "main/container"

Main::Container.finalize! do |container|
  require "main/enqueue"
  container.register :enqueue, Main::Enqueue.new
end

require "main/application"
require "main/view"
require "main/transactions"

Main::Container.require "transactions/**/*.rb"
