require_relative "app_prototype/container"

AppPrototype::Container.finalize! do |container|
  require "logger"
  container.register(:logger, Logger.new(container.root.join("log/app.log")))

  require "rodakase/call_sheet_composer"
  container.register(:transaction, Rodakase::CallSheetComposer.new(container))
end

app_paths = Pathname(__FILE__).dirname.join("../apps").realpath.join("*")
Dir[app_paths].each { |f| require "#{f}/core/boot" }
