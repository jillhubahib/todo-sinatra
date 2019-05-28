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

  put '/tasks/:id' do
    protected!

    task = current_user.tasks.find_by(id: params[:id])

    if task
      updated_attributes = params.dup
      if params[:completed_at]
        completed_at = task.completed_at.nil? ? Time.current : nil
        updated_attributes[:completed_at] = completed_at
      end

      task.update(updated_attributes)
    end
  end

  delete '/tasks/?:id' do
    protected!

    delete_items
  end

  private

  def delete_items
    if params[:id] == 'all' && current_user.tasks.completed.destroy_all
      return json_success_return
    end

    task = current_user.tasks.find(params[:id])
    if task && task.destroy
      json_success_return
    else
      json_error_return
    end
  end

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

  def json_success_return
    { status: 'success' }.to_json if request.xhr?
  end

  def json_error_return
    { status: 'success' }.to_json if request.xhr?
  end
end
