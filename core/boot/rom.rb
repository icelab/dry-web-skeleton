require "rom"
require "rom-repository"

AppPrototype::Container.namespace("persistence") do |container|
  ROM.use :auto_registration
  ROM.setup :sql, container.config.app.database_url

  %w(relations commands).each do |type|
    Dir[container.root.join("app/persistence/#{type}/**/*.rb")].each(&method(:require))
  end

  container.register("rom", ROM.finalize.container)
end
