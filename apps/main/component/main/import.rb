require_relative "container"

module Main
  Import = Main::Container::Inject.args

  def self.Import(*args)
    Import[*args]
  end
end
