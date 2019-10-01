# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Event managment', type: :feature do
  scenario 'redirect to login path if user is not signed in' do
    visit new_event_path
    expect(page).to have_content('Login here')
  end
end

RSpec.feature 'Event managment', type: :feature do
  scenario 'create event when user is logged in' do
    sign_up_with('Paul', 'paul@gmail.com', '123456')
    sign_in_with('paul@gmail.com', '123456')
    click_on 'Create Event'
    fill_in 'Name', with: "Paul's Event"
    page.find('#event_date').set('2040-01-01')
    click_button 'Create event'
    expect(page).to have_content('Event successfully created')
  end
end

RSpec.feature 'Event managment', type: :feature do
  scenario 'create event with past date' do
    sign_up_with('Paul', 'paul@gmail.com', '123456')
    sign_in_with('paul@gmail.com', '123456')
    click_on 'Create Event'
    fill_in 'Name', with: "Paul's Event"
    page.find('#event_date').set('1998-01-01')
    click_button 'Create event'
    expect(page).to have_content("Event date can't be in the past")
  end
end

def sign_up_with(name, email, password)
  visit new_user_path
  fill_in 'Name', with: name
  fill_in 'Email', with: email
  fill_in 'Password', with: password
  click_on 'Submit'
end

def sign_in_with(_email, _password)
  visit login_path
  fill_in 'Email', with: 'paul@gmail.com'
  fill_in 'Password', with: '123456'
  click_button 'Login'
end
