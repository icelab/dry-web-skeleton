require "app_prototype/email"
require "main/container"

module Main
  class Email < AppPrototype::Email
    configure do |config|
      config.root = Container.root.join("emails")
      config.name = "email"
    end
  end
end
