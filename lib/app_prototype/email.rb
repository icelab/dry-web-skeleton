require "dry-equalizer"
require "dry-view"
require "slim"
require "tilt/erb"
require "app_prototype/import"

module AppPrototype
  class Email < Dry::View::Layout
    include Dry::Equalizer(:to_h)
    include AppPrototype::HashImport["i18n.t"]

    attr_reader :options

    setting :formats, {html: :slim, txt: :erb}

    def initialize(options)
      super
      @options = options
    end

    def to_h
      {to: to, subject: subject, html_body: html_body, text_body: text_body}
    end

    def to
      options.fetch(:to)
    end

    def subject
      options.fetch(:subject)
    end

    def html_body
      call(options.merge(format: :html))
    end

    def text_body
      call(options.merge(format: :txt))
    end
  end
end
