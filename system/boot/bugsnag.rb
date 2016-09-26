AppPrototype::Container.finalize(:bugsnag) do |container|
  require "bugsnag"

  Bugsnag.configure do |config|
    config.project_root = Pathname(__FILE__).join("../..").realpath.dirname.freeze
    config.release_stage = ENV.fetch("RACK_ENV", "development")
    config.notify_release_stages = ["production"]
    config.api_key = AppPrototype::Container.settings.bugsnag_api_key
    config.logger.level = Logger::INFO
  end
end
