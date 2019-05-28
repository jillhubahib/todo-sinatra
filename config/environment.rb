require 'bundler'
Bundler.require

# get the path of the root of the app
APP_ROOT = File.expand_path("..", __dir__)

require_all "#{APP_ROOT}/app"
require_all "#{APP_ROOT}/config"

# configure settings
class ApplicationController < Sinatra::Base
  set :root, APP_ROOT
  set :views, File.join(APP_ROOT, "app", "views")

  # enable :sessions
  # set :expire_after, 2592000
  use Rack::Session::Cookie, expire_after: 2592000, secret: 'mzKR8RGfQM2UVd6g'

  configure :development do
    use BetterErrors::Middleware
    BetterErrors.application_root = File.expand_path('..', __FILE__)
  end
end
