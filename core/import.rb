require_relative "container"

module AppPrototype
  Import = AppPrototype::Container.import

  def self.Import(*args)
    Import[*args]
  end
end
