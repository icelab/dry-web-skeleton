require "rodakase/application"
require_relative "container"

module Main
  class Application < Rodakase::Application
    setting :container, Container

    use Rack::Session::Cookie, key: "app_prototype.session", secret: Container.config.app.session_secret

    plugin :path
    plugin :indifferent_params
    plugin :flash

    plugin :render, engine: "html.slim", layout: "layouts/public"
    plugin :partials, views: "views"

    plugin :webpack_assets,
      precompiled: (ENV["RACK_ENV"] == "production"),
      development_server_base_url: "http://#{ENV['WEBPACK_ASSETS_DEVELOPMENT_HOST']}:#{ENV['WEBPACK_ASSETS_DEVELOPMENT_PORT']}"

    route do |r|
      # TODO: home route and controller

      r.multi_route
    end

    load_routes!
  end
end
