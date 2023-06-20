require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:user).class_name('User') }
    it { is_expected.to belong_to(:likable) }
  end
end
