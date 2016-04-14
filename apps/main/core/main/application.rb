require "rack/csrf"
require "dry/web/application"
require "either_result_matcher/either_extensions"
require_relative "container"
require "roda_plugins"

module Main
  class Application < Dry::Web::Application
    configure do |config|
      config.routes = "web/routes".freeze
      config.container = Container
    end

    opts[:root] = Pathname(__FILE__).join("../..").realpath.dirname

    use Rack::Session::Cookie, key: "app_prototype.session", secret: AppPrototype::Container.options.session_secret

    use Rack::Csrf, raise: true

    plugin :flash
    plugin :view
    plugin :page

    def name
      :main
    end

    route do |r|
      r.root do
        r.view "home"
      end

      r.multi_route
    end

    load_routes!
  end
end
