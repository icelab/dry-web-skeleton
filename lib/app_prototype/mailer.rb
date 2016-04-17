require "app_prototype/import"

module AppPrototype
  class Mailer
    include AppPrototype::Import("logger", "postmark")

    def deliver(mail)
      logger.debug("[AppPrototype::Mailer] delivering: #{mail.inspect}")
      postmark.deliver(mail.to_h.merge(from: from))
    end

    private

    def from
      options.app_mailer_from_email
    end

    def options
      Container["config"]
    end
  end
end
