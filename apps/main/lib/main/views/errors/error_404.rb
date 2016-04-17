require "main/view"

module Main
  module Views
    module Errors
      class Error404 < Main::View
        configure do |config|
          config.template = "errors/404"
        end
      end
    end
  end
end
