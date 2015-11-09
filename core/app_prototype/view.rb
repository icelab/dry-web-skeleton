require "rodakase/view"
require "app_prototype/container"

module AppPrototype
  class View < Rodakase::View::Layout
    setting :root, Container.root.join("templates")
    setting :engine, :slim
    setting :name, "app"
  end
end
