require "call_sheet"

module Rodakase
  class CallSheetComposer
    attr_reader :container

    def initialize(container)
      @container = container
    end

    def define(&block)
      CallSheet(container: container, &block)
    end
  end
end
