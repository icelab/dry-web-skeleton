require "dry-transaction"

require "app_prototype/transactions"
require "main/container"

module Main
  class Transactions < AppPrototype::Transactions
    configure do |config|
      config.container = Main::Container
    end
  end
end
