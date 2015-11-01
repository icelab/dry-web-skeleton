require "./config/environment"

class AppPrototype < Roda
  use Rack::Session::Cookie, :secret => ENV["SESSION_SECRET"]

  plugin :render, engine: "html.slim"
  plugin :partials, views: "views"
  plugin :indifferent_params
  plugin :flow

  plugin :multi_route
  Dir["#{APP_ROOT}/routes/*.rb"].each do |f| require f end

  plugin :path
  # TODO: define paths somewhere

  route do |r|
    r.multi_route
  end

  include ApplicationHelper
end

Dir["#{File.dirname(__FILE__)}/config/container/**/*.rb"].each do |registration_file|
  require registration_file
end
