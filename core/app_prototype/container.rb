require "rodakase/container"

module AppPrototype
  class Container < Rodakase::Container
    configure do
      load_paths! "lib", "core"
    end
  end
end
