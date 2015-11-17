module Main
  class Container < Rodakase::Container
    setting :root, Pathname(__FILE__).join("../..").realpath.dirname.freeze
    setting :auto_register, %w(
      lib/operations
      lib/validators
      lib/views
    )

    configure do
      load_paths! "lib", "core"
    end
  end
end
