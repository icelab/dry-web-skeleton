module Main
  # This is our main layout context that we inject into view
  #
  # Methods available in this object will be available in the main layout
  class Page
    attr_reader :config
    attr_accessor :flash_messages

    def initialize(config)
      @config = config
      @flash_messages = {}
    end

    def asset_path(name)
      # TODO: integrate with Webpack
      name
    end
  end
end
