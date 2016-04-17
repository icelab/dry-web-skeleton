require "rom-repository"
require "app_prototype/container"
require "app_prototype/import"

AppPrototype::Container.boot! :rom

module AppPrototype
  class Repository < ROM::Repository
    # This .new shouldn't be needed, since repos should work with dry-
    # auto_inject. This is not working yet, so this remains as a workaround.
    def self.new(rom = nil)
      super(rom || AppPrototype::Container["persistence.rom"])
    end
  end
end
