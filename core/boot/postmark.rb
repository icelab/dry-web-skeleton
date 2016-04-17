require "postmark"

AppPrototype::Container.boot! :config
AppPrototype::Container.register "postmark", Postmark::ApiClient.new(AppPrototype::Container["config"].postmark_api_key)
