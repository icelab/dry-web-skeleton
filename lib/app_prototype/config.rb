require "types"
require "yaml"

module AppPrototype
  class Config < Dry::Types::Struct
    RequiredString = Types::Strict::String.constrained(min_size: 1)

    attribute :database_url, RequiredString
    attribute :session_secret, RequiredString

    attribute :assets_server_url, Types::String
    attribute :precompiled_assets, Types::Form::Bool # TODO: add .default(false) when dry-types allows it
    attribute :precompiled_assets_host, Types::String

    attribute :bugsnag_api_key, Types::String

    def self.load(root, name, env)
      path = root.join("config").join("#{name}.yml")
      yaml = File.exist?(path) ? YAML.load_file(path) : {}

      config = schema.keys.inject({}) { |memo, key|
        value = ENV.fetch(
          key.to_s.upcase,
          yaml.fetch(env.to_s, {})[key.to_s]
        )

        memo[key] = value
        memo
      }

      new(config)
    end
  end
end
