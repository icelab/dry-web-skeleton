require "dry/web/container"
require "dry/web/umbrella"

module AppPrototype
  class Container < Dry::Web::Umbrella
    configure do
      config.name = :main
      config.auto_register = %w[lib/authentication]
    end

    load_paths! "lib", "core"
  end
end
