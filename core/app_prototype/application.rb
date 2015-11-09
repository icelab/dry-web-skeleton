require "rodakase/application"
require_relative "container"

module AppPrototype
  class Application < Rodakase::Application
    setting :container, Container

    use Rack::Session::Cookie, key: "app_prototype.session", secret: Container.config.app.session_secret

    plugin :path
    plugin :indifferent_params
    plugin :flash

    plugin :render, engine: "html.slim", layout: "layouts/public"
    plugin :partials, views: "views"

    route do |r|
      # TODO: home route and controller

      r.multi_route
    end

    load_routes!
  end
end
