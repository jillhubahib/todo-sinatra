class UsersController < ApplicationController
  get '/users/new' do
    if !logged_in?
      erb :'users/new'
    else
      redirect '/tasks'
    end
  end

  post '/users' do
    user = User.new(username: user_params[:username], email: user_params[:email], password: user_params[:password])

    if user.save
      session[:user_id] = user.id
      redirect '/tasks'
    else
      redirect '/users/new'
    end
  end

  private

  def user_params
    params[:user]
  end
end
