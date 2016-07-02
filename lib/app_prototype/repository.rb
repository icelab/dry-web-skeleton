require "rom-repository"
require "app_prototype/container"
require "app_prototype/import"

AppPrototype::Container.boot! :rom

module AppPrototype
  class Repository < ROM::Repository::Root
    include AppPrototype::Import.args["persistence.rom"]
  end
end
