require "sequel"
require "rom"

AppPrototype::Container.boot! :config

Sequel.database_timezone = :utc
Sequel.application_timezone = :local

AppPrototype::Container.namespace "persistence" do |container|
  config = ROM::Configuration.new(:sql, container["config"].database_url, extensions: [:error_sql, :pg_array, :pg_json])

  container.register("config", config)

  container.require("core/container/persistence")

  container.finalize(:rom) do
    config.auto_registration(container.root.join("lib/persistence"))
    container.register("rom", ROM.container(config))
  end
end
