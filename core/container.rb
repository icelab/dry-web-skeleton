require "logger"

module AppPrototype
  class Container < Rodakase::Container
    setting :root, Pathname(__FILE__).join("..").realpath.dirname.freeze
    setting :auto_load, true

    $LOAD_PATH.unshift(root.join("lib").to_s)

    configure do |container|
      register(:logger) do
        Logger.new(container.root.join("log/app.log"))
      end

      # We're not using this yet, but leaving this here to try later.
      register(:renderer) do
        Rodakase::Renderer.new(container.root.join("templates"))
      end
    end
  end
end
