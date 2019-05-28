require 'spec_helper'

RSpec.describe 'User' do
  it 'can sign up' do
    user = build(:user)

    visit '/users/new'
    fill_in 'user[username]', with: user.username
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    click_on 'Submit'

    new_user = User.last
    expect(new_user.username).to eq(user.username)
    expect(new_user.email).to eq(user.email)
    expect(page).to have_field("task[name]", placeholder: 'Add a task')
  end

  it 'can log in' do
    user = create(:user)

    visit '/sessions/new'
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    click_on 'Submit'
    expect(page).to have_field("task[name]", placeholder: 'Add a task')
  end
end
