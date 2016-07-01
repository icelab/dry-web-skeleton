require "postmark"

AppPrototype::Container.register "postmark", Postmark::ApiClient.new(AppPrototype::Container.settings.postmark_api_key)
