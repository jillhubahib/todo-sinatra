class TasksController < ApplicationController
  VALID_FILTER = %w(all active completed)

  get '/tasks/?:filter?/?:page?' do
    protected!

    # TODO: add pagination and search feature
    @tasks = filtered_tasks
    @active_count = current_user.tasks.active.size

    erb :'tasks/index'
  end

  post '/tasks' do
    protected!

    task = current_user.tasks.build(name: params[:task][:name])
    task.save # TODO: add flash
    redirect '/tasks'
  end

  private

  def filter
    @filter ||= params[:filter]
  end

  def filtered_tasks
    if filter && VALID_FILTER.include?(filter )
      current_user.tasks.send(params[:filter])
    else
      current_user.tasks.all
    end
  end
end
