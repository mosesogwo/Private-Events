require 'rails_helper'

RSpec.feature 'Authentication', type: :feature do
  scenario 'unregistered user logs in' do
    visit login_path
    fill_in 'Email', with: 'moses@gmail.com'
    fill_in 'Password', with: '123456'
    sleep(2)
    click_button 'Login'
    sleep(3)
    expect(page).to have_content('Error logging in')
  end

  scenario 'registered user logs in' do
    # User.create!(name: 'Paul', email: 'paul@gmail.com', password: '123456')
    sign_up_with('Paul', 'paul@gmail.com', '123456')
    visit login_path
    fill_in 'Email', with: 'paul@gmail.com'
    fill_in 'Password', with: '123456'
    sleep(2)
    click_button 'Login'
    sleep(3)
    expect(page).to have_content("You're logged in")
  end

  def sign_up_with(name, email, password)
    visit new_user_path
    fill_in 'Name', with: name
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    click_on 'Submit'
  end
end