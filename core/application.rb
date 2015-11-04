require_relative "container"
require_relative "import"

module AppPrototype
  class Application < Rodakase::Application
    setting :container, Container

    use Rack::Session::Cookie, :secret => ENV["SESSION_SECRET"]

    plugin :path
    plugin :indifferent_params
    plugin :flash

    plugin :render, engine: "html.slim", layout: "layouts/public"
    plugin :partials, views: "views"

    plugin :webpack_assets,
      precompiled: (ENV["RACK_ENV"] == "production"),
      development_server_base_url: "http://#{ENV['WEBPACK_ASSETS_DEVELOPMENT_HOST']}:#{ENV['WEBPACK_ASSETS_DEVELOPMENT_PORT']}"

    route do |r|
      r.root do
        view :home
      end

      r.multi_route
    end

    load_routes!
  end
end
