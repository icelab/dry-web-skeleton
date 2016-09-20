require "dry/web/container"
require "dry/web/umbrella"
require_relative "settings"

module AppPrototype
  class Container < Dry::Web::Umbrella
    configure do |config|
      config.name = :core
      config.system_dir = "component"
      config.settings_loader = AppPrototype::Settings
      config.auto_register = %w[lib/authentication]
    end

    load_paths! "lib", "component"

    def self.settings
      config.settings
    end
  end
end
