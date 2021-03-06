# install and require all dependencies
require 'sinatra/base'
require 'sprockets'
require 'uglifier'
require 'bootstrap'
if development?
  require 'pry-byebug'
  require 'better_errors'
end

class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension

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
    if logged_in?
      redirect '/tasks'
    else
      redirect '/sessions/new'
    end
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

    def show_active(filter, current_filter)
      filter.to_s.downcase == current_filter || filter.to_s.downcase == '' ? 'active' : ''
    end

    def show_completed_by(is_completed, filter)
      is_completed && (filter.nil? || filter && filter == 'all') ? 'completed' : ''
    end
  end
end
