require 'rails_helper'

RSpec.describe 'Comments', type: :request do
  let(:review) { create(:review) }

  before do
    sign_in create(:user)
  end

  describe 'GET /index' do
    it 'returns http success' do
      get review_comments_path(review)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'returns http success' do
      get new_review_comment_path(review)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    let(:valid_attributes) do
      {
        body: Faker::Lorem.paragraph(sentence_count: 5)
      }
    end

    let(:invalid_attributes) do
      {
        body: nil
      }
    end

    context 'with valid parameters' do
      it 'creates a new review' do
        expect do
          post review_comments_url(review, { comment: valid_attributes, format: :turbo_stream })
        end.to change(Comment, :count).by(1)
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new review' do
        expect do
          post review_comments_url(review, { comment: invalid_attributes, format: :turbo_stream })
        end.to change(Comment, :count).by(0)
      end

      it 'redirects to the /new when params are invalid' do
        post review_comments_url(review, { comment: invalid_attributes, format: :turbo_stream })
        expect(response).to redirect_to(new_review_comment_path(review))
      end
    end
  end
end
