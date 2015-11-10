env = ENV.fetch("RACK_ENV", :development).to_sym

require_relative "app_prototype/container"

AppPrototype::Container.configure(env) do |container|
  require "logger"
  container.register(:logger, Logger.new(container.root.join("log/app.log")))

  # require 'rodakase/transaction'
  # container.register(:transaction, Rodakase::Transaction::Composer.new(container))
end

app_paths = Pathname(__FILE__).dirname.join("../apps").realpath.join("*")
Dir[app_paths].each { |f| require "#{f}/core/boot" }
