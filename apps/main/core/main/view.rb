require "slim"
require "dry-view"

require "main/container"
require "main/page"

require "app_prototype/assets"

module Main
  Container.register "page", Page.new(Container.config)

  class View < Dry::View::Layout
    setting :root, Container.root.join("web/templates")
    setting :scope, Container["page"]
    setting :formats, {html: :slim}
    setting :name, "application"

    # Example of alternative layouts
    # class Admin < View
    #   setting :name, "admin"
    # end
  end
end
