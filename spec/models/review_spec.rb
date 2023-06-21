require 'rails_helper'

RSpec.describe Review, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:user).class_name('User') }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:book_name) }
    it { is_expected.to validate_presence_of(:author) }
  end

  describe '#liked?' do
    subject(:review) { build(:review) }

    let(:user) { build(:user) }

    it 'return false if the review is not liked by the user' do
      expect(review).not_to be_liked(user:)
    end

    it 'return true if the review is liked by the user' do
      create(:like_of_review, user:, likable: review)

      expect(review).to be_liked(user:)
    end
  end
end
