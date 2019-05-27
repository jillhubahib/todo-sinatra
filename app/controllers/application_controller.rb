# install and require all dependencies
require 'sinatra/base'
require 'sprockets'
require 'uglifier'
require 'bootstrap'
require 'pry-byebug'
require 'better_errors'

class ApplicationController < Sinatra::Base
  set :assets, Sprockets::Environment.new

  # append assets paths
  assets.append_path 'public/stylesheets'
  assets.append_path 'public/javascripts'
  assets.append_path File.join(Gem::Specification.find_by_name('popper_js').gem_dir, 'assets', 'javascripts')

  # compress assets
  assets.js_compressor =  :uglify
  assets.css_compressor = :scss

  get "/public/*" do
    env['PATH_INFO'].sub!('/public', '')
    settings.assets.call(env)
  end

  get '/' do
    erb :index
  end

  helpers do
    def logged_in?
      !!current_user
    end

    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def protected!
      halt 401, erb(:unauthorized) unless logged_in?
    end
  end
end
