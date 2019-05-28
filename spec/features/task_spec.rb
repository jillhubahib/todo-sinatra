require 'spec_helper'

RSpec.describe 'Task' do
  let!(:user) { create(:user) }
  let!(:active_task) { create(:task, user: user) }
  let!(:completed_task) { create(:task, user: user, completed_at: Time.current) }

  before(:each) do
    visit '/sessions/new'
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    click_on 'Submit'
  end

  context "filters" do
    it 'displays active task only' do
      find("a[href=\"/tasks/active\"]").click

      expect(page).to have_content(active_task.name)
      expect(page).to have_no_content(completed_task.name)
      expect(find('.task-active-counter').text).to eq "1"
    end

    it 'displays completed task only' do
      find_link('Completed').click

      expect(page).to have_content(completed_task.name)
      expect(page).to have_no_content(active_task.name)
    end
  end

  it 'creates a task' do
    task_name = build(:task).name

    fill_in 'task[name]', with: task_name
    find('.task-add').send_keys :return
    find('.task-add').click # this assures us to wait for the page to load from a redirect

    expect(page).to have_content(task_name)
    expect(Task.find_by(name: task_name)).to be_truthy
  end

  it 'completes a task' do
    find('.task-name', text: active_task.name).click

    page.has_css?('.task-name.completed', text: active_task.name, count: 1)
    expect(active_task.reload.completed_at).not_to be_nil
  end
end
