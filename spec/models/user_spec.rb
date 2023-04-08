require 'rails_helper'

RSpec.describe User, type: :model do
  let(:valid_email) { 'test@mail.com' }
  let(:valid_password) { 'teSt1*pass' }
  let(:valid_username) { 'unique_username' }

  describe 'validation' do
    it 'passed with valid attributes' do
      expect(User.new(email: valid_email, password: valid_password, username: valid_username)).to be_valid
    end

    it 'failed valid without an email' do
      expect(User.new(password: valid_password, username: valid_username)).to_not be_valid
    end

    it 'failed without a password' do
      expect(User.new(email: valid_email, username: valid_username)).to_not be_valid
    end

    it 'failed without an username' do
      expect(User.new(email: valid_email, password: valid_password)).to_not be_valid
    end
  end

  describe 'user creation' do
    before(:all) do
      User.delete_all
      create(:user, email: 'new@mail.ru', username: 'new_username', password: 'validP**23ew')
    end

    it 'is successful with unique email and username' do
      user = build(:user, email: 'unique@mail.ru', username: 'unique_username', password: valid_password)
      expect(user.valid?).to be_truthy
    end

    it 'is failed with duplicated email' do
      user = build(:user, email: 'new@mail.ru', username: 'unique_username', password: valid_password)
      expect(user.valid?).to be_falsey
    end

    it 'is failed with duplicated username' do
      user = build(:user, email: 'unique@mail.ru', username: 'new_username', password: valid_password)
      expect(user.valid?).to be_falsey
    end
  end

  describe 'password validation' do
    it 'passed when password is valid' do
      user = build(:user, email: 'unique@mail.ru', username: 'new_username', password: valid_password)
      expect(user.valid?).to be_falsey
    end

    it 'failed, requires a minimun password length of 8 characters' do
      user = build(:user, password: 's' * 7, username: valid_username, email: valid_email)

      expect(user).not_to be_valid
      expect(user.errors[:password]).to include('Password is too short (minimum is 8 characters)')
    end

    it 'failed, requires a maximum password length of 30 characters' do
      user = build(:user, password: 's' * 31, username: valid_username, email: valid_email)

      expect(user).not_to be_valid
      expect(user.errors[:password]).to include('Password is too long (maximum is 30 characters)')
    end

    it 'failed, requires a password with at least one digit, one lowercase letter, one uppercase letter, and one special character' do
      user = build(:user, password: 'password', username: valid_username, email: valid_email)
      expect(user).not_to be_valid
      expect(user.errors[:password]).to include('must contain at least one digit, one lowercase letter, one uppercase letter, and one special character')

      user = build(:user, password: 'password1', username: valid_username, email: valid_email)
      expect(user).not_to be_valid
      expect(user.errors[:password]).to include('must contain at least one digit, one lowercase letter, one uppercase letter, and one special character')

      user = build(:user, password: 'Password1', username: valid_username, email: valid_email)
      expect(user).not_to be_valid
      expect(user.errors[:password]).to include('must contain at least one digit, one lowercase letter, one uppercase letter, and one special character')

      user = build(:user, password: 'Password*', username: valid_username, email: valid_email)
      expect(user).not_to be_valid
      expect(user.errors[:password]).to include('must contain at least one digit, one lowercase letter, one uppercase letter, and one special character')
    end

    it 'is valid when the password contains at least one digit, one lowercase letter, one uppercase letter, and one special character' do
      user = build(:user, password: 'PPPPassword1*', username: valid_username, email: valid_email)
      expect(user).to be_valid
    end
  end
end
