AppPrototype::Container.namespace "persistence" do |persistence|
  persistence.finalize(:rom) do
    init do
      require "sequel"
      require "rom"

      Sequel.database_timezone = :utc
      Sequel.application_timezone = :local

      rom_config = ROM::Configuration.new(
        :sql, container.settings.database_url, extensions: [:error_sql, :pg_array, :pg_json]
      )

      persistence.register("config", rom_config)
    end

    start do
      config = container["persistence.config"]
      config.auto_registration(container.root.join("lib/persistence"))

      persistence.register("rom", ROM.container(config))
    end
  end
end
