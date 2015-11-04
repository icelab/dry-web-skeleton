module TestHelpers
  module_function

  def container
    AppPrototype::Application
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
