require "main/view"

module Main
  module Views
    class Home < Main::View
      configure do |config|
        config.template = "home"
      end
    end
  end
end
