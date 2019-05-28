class SessionsController < ApplicationController
  # Login page
  get '/sessions/new' do
    if !logged_in?
      erb :'sessions/new'
    else
      redirect '/tasks'
    end
  end

  post '/sessions' do
    user = User.find_by(email: user_params[:email])

    if user && user.authenticate(user_params[:password])
      session[:user_id] = user.id
      redirect '/tasks'
    else
      redirect '/sessions/new'
    end
  end

  # Logout
  delete '/sessions' do
    if logged_in?
      session.clear
      redirect '/sessions/new'
    else
      redirect '/'
    end
  end

  private

  def user_params
    params["user"]
  end
end
