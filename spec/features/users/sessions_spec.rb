require 'rails_helper'

RSpec.describe 'Login page', type: :feature do
  it 'user is logged in with valid credentials' do
    create(:user, email: 'test@email.ru', password: 'Sup&eR7PP')
    visit '/users/sign_in'

    within('form') do
      fill_in 'Email', with: 'test@email.ru'
      fill_in 'Password', with: 'Sup&eR7PP'
    end

    click_button 'Log in'
    expect(page).to have_current_path(root_path)
  end

  it 'user is not logged in with invalid credentials' do
    visit '/users/sign_in'

    within('form') do
      fill_in 'Email', with: 'test@email.ru'
      fill_in 'Password', with: 'Sup&eR7PP'
    end

    click_button 'Log in'
    expect(page).to have_current_path('/users/sign_in')
  end
end
