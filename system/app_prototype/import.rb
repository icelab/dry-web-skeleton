require_relative "container"

module AppPrototype
  Import = AppPrototype::Container.injector

  auto_inject = Dry::AutoInject(AppPrototype::Container)

  HashImport = -> *keys do
    keys.each do |key|
      unless AppPrototype::Container.key?(key)
        AppPrototype::Container.load_component(key)
      end
    end

    auto_inject.hash[*keys]
  end

  def self.Import(*args)
    Import[*args]
  end
end
