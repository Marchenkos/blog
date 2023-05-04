require 'rails_helper'

RSpec.describe User, type: :model do
  let(:valid_email) { 'test@mail.com' }
  let(:valid_password) { 'teSt1*pass' }
  let(:valid_username) { 'unique_username' }

  describe 'validation' do
    subject(:user) { build(:user) }

    it 'passed with valid attributes' do
      expect(user).to be_valid
    end

    it 'failed valid without an email' do
      user.email = nil

      expect(user).not_to be_valid
    end

    it 'failed without a password' do
      user.password = nil

      expect(user).not_to be_valid
    end

    it 'failed without an username' do
      user.username = nil

      expect(user).not_to be_valid
    end
  end

  describe 'uniquless validation' do
    let(:valid_user) { create(:user) }

    it 'passed with unique email and username' do
      user = build(:user)

      expect(user).to be_valid
    end

    it 'failed with duplicated email' do
      user = build(:user, email: valid_user.email)

      expect(user).not_to be_valid
    end

    it 'failed with duplicated username' do
      user = build(:user, username: valid_user.username)

      expect(user).not_to be_valid
    end
  end

  describe 'password validation' do
    subject(:user) { build(:user) }

    it 'is valid when the password contains at digit, lowercase, uppercase letters and special character' do
      user.password = 'PPPPassword1*'

      expect(user).to be_valid
    end

    it 'failed, requires a minimun password length of 8 characters' do
      user.password = 's' * 7

      expect(user).not_to be_valid
      expect(user.errors[:password]).to include('Password is too short (minimum is 8 characters)')
    end

    it 'failed, requires a maximum password length of 30 characters' do
      user.password = 's' * 31

      expect(user).not_to be_valid
      expect(user.errors[:password]).to include('Password is too long (maximum is 30 characters)')
    end

    it 'failed, when password do not contains digit' do
      user.password = 'Password*'

      expect(user).not_to be_valid
      expect(user.errors[:password]).to include(I18n.t('errors.models.password.complexity'))
    end

    it 'failed, when password do not contains uppercase letter' do
      user.password = 'password1*'

      expect(user).not_to be_valid
      expect(user.errors[:password]).to include(I18n.t('errors.models.password.complexity'))
    end

    it 'failed, when password do not contains special character' do
      user.password = 'Password1'

      expect(user).not_to be_valid
      expect(user.errors[:password]).to include(I18n.t('errors.models.password.complexity'))
    end

    it 'failed, when password do not contains lowercase letter' do
      user.password = 'PA1212*&'

      expect(user).not_to be_valid
      expect(user.errors[:password]).to include(I18n.t('errors.models.password.complexity'))
    end
  end
end
