require_relative "container"

module Main
  Import = Main::Container.injector

  def self.Import(*args)
    Import[*args]
  end
end
