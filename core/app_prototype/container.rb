require "rodakase/container"

module AppPrototype
  class Container < Rodakase::Container
    setting :root, Pathname(__FILE__).join("../..").realpath.dirname.freeze
    setting :auto_load, true

    $LOAD_PATH.unshift(root.join("app").to_s)
    $LOAD_PATH.unshift(root.join("lib").to_s)
    $LOAD_PATH.unshift(root.join("core").to_s)
    $LOAD_PATH.unshift(root.join("vendor").to_s)

    # Set default auto-load path to app/
    def self.lib_path
      root.join("app")
    end
  end
end
