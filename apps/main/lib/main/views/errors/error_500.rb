require "main/view"

module Main
  module Views
    module Errors
      class Error500 < Main::View
        configure do |config|
          config.template = "errors/500"
        end
      end
    end
  end
end
