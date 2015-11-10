module Main
  class Container < AppPrototype::Container
    setting :root, Pathname(__FILE__).join("../..").realpath.dirname.freeze
    setting :auto_load, true

    $LOAD_PATH.unshift(root.join("app"))
    $LOAD_PATH.unshift(root.join("core"))
    $LOAD_PATH.unshift(root.join("lib"))
  end
end
