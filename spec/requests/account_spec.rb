require 'rails_helper'

RSpec.describe 'Accounts', type: :request do
  before do
    sign_in create(:user)
  end

  describe 'GET /index' do
    it 'returns http success' do
      get account_index_path
      expect(response).to be_successful
    end
  end
end
