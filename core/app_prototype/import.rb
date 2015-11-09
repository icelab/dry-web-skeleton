require_relative "container"

module AppPrototype
  Import = AppPrototype::Container.import_module

  def self.Import(*args)
    Import[*args]
  end
end
