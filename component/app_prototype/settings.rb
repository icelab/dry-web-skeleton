require "dry/web/settings"
require "dry-types"

module AppPrototype
  class Settings < Dry::Web::Settings
    module Types
      include Dry::Types.module

      module Required
        String = Types::Strict::String.constrained(min_size: 1)
      end
    end

    setting :database_url, RequiredString
    setting :session_secret, RequiredString

    setting :assets_server_url, Types::String
    setting :precompiled_assets, Types::Form::Bool # TODO: add .default(false) when dry-types allows it
    setting :precompiled_assets_host, Types::String

    setting :app_mailer_from_email, Types::String

    setting :bugsnag_api_key, Types::String

    setting :postmark_api_key, Types::String
  end
end
