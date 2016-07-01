require "dry/web/container"

module AppPrototype
  class Container < Dry::Web::Container
    configure do
      config.name = :main
      config.auto_register = %w[lib/authentication]
    end

    load_paths! "lib", "core"
  end
end
