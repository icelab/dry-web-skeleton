module Main
  class Container < Dry::Web::Container
    require root.join("component/app_prototype/container")
    import AppPrototype::Container

    configure do |config|
      config.name = :main

      config.root = Pathname(__FILE__).join("../..").realpath.dirname.freeze

      config.auto_register = %w[
        lib/main
      ]
    end

    load_paths! "lib", "component"
  end
end
