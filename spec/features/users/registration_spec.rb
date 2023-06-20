require 'rails_helper'

RSpec.describe "Registration page", type: :feature do
  it 'creates a new user and navigate to root path' do
    visit '/users/sign_up'

    within('form') do
      fill_in 'Email', with: 'test@email.ru'
      fill_in 'User name', with: 'test_user'
      fill_in 'Password', with: 'Sup&eR7PP'
      fill_in 'Confirm password', with: 'Sup&eR7PP'
    end

    expect{
      click_button 'Sign up'
    }.to change(User, :count).by(1)

    expect(current_path).to eql(root_path)
  end

  it 'does not create a new user with invalid params' do
    visit '/users/sign_up'

    within('form') do
      fill_in 'Email', with: 'test@email.ru'
      fill_in 'Password', with: 'Sup&eR7PP'
    end

    expect{
      click_button 'Sign up'
    }.to change(User, :count).by(0)
  end
end