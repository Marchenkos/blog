require 'rails_helper'

RSpec.describe "Login page", type: :feature do
  describe 'the login process' do
    it 'user is signed in with valid credentials' do
      create(:user, email: 'test@email.ru', password: 'Sup&eR7PP')
      visit '/users/sign_in'

      within('form') do
        fill_in 'Email', with: 'test@email.ru'
        fill_in 'Password', with: 'Sup&eR7PP'
      end

      click_button 'Log in'

      expect(current_path).to eql(root_path)
    end
  end
end