# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Users::SessionsController, type: :request do
  let(:password) { '&TestPassword01*' }
  let(:user) { create(:user, password:) }

  context 'with valid credentials' do
    # it 'logs in successfully' do
    #   post user_session_path, params: { user: { email: user.email, password: } }
    #   expect(response.status).to eq 302
    #   expect(response).to redirect_to('/')
    # end
  end
end
