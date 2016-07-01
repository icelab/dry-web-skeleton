require "bugsnag"

module AppPrototype
  class Application < Roda
    use Bugsnag::Rack

    plugin :error_handler

    route do |r|
      r.run Main::Application.freeze.app
    end

    error do |e|
      Bugsnag.auto_notify e
      raise e
    end
  end
end
