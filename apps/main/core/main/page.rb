require "app_prototype/assets"

module Main
  # This is our main layout context that we inject into view
  #
  # Methods available in this object will be available in the main layout
  class Page
    attr_reader :options

    def initialize(options = {})
      @options = options
    end

    def assets
      self[:assets]
    end

    def with(new_options)
      self.class.new(options.merge(new_options))
    end

    def [](name)
      options.fetch(name)
    end
  end
end
