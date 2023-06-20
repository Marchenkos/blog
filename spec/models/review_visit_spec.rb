require 'rails_helper'

RSpec.describe ReviewVisit, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:user).class_name('User').optional }
    it { is_expected.to belong_to(:review).class_name('Review') }
  end
end
