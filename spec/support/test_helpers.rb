module TestHelpers
  module_function

  def container
    AppPrototype::Container
  end

  def app
    AppPrototype::Application.app
  end

  def rom
    container["persistence.rom"]
  end

  def db_connection
    rom.gateways[:default].connection
  end
end
