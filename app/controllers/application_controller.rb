# install and require all dependencies
require 'sinatra/base'

class ApplicationController < Sinatra::Base
  get '/' do
    'Hello World!'
  end
end
