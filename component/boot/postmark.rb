AppPrototype::Container.finalize :postmark do |container|
  require "postmark"
  container.register "postmark", Postmark::ApiClient.new(AppPrototype::Container.settings.postmark_api_key)
end
