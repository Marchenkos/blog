require 'rails_helper'

RSpec.describe '/reviews', type: :request do
  let(:review) { create(:review) }

  describe 'GET /index' do
    it 'returns http success' do
      get reviews_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get review_url(review)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'returns http success' do
      sign_in create(:user)

      get new_review_url
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    let(:valid_attributes) do
      {
        title: Faker::Lorem.sentence,
        book_name: Faker::Book.title,
        author: Faker::Book.author,
        body: Faker::Lorem.paragraph(sentence_count: 5)
      }
    end

    let(:invalid_attributes) do
      {
        title: nil,
        book_name: nil,
        author: Faker::Book.author,
        body: Faker::Lorem.paragraph(sentence_count: 5)
      }
    end

    let(:user) { create(:user) }
    let(:review) { create(:review) }

    before do
      sign_in user
    end

    context 'with valid parameters' do
      it 'creates a new review' do
        expect do
          post reviews_url, params: { review: valid_attributes }
        end.to change(Review, :count).by(1)
      end

      it 'redirects to the /account_index_path' do
        post reviews_url, params: { review: valid_attributes }
        expect(response).to redirect_to(account_index_path)
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new review' do
        expect do
          post reviews_url, params: { review: invalid_attributes }
        end.to change(Review, :count).by(0)
      end

      it 'redirects to the /new when params are invalid' do
        post reviews_url, params: { review: invalid_attributes }
        expect(response).to redirect_to(new_review_url)
      end
    end
  end

  describe 'POST /toggle_like' do
    let(:user) { create(:user) }

    before do
      sign_in user
    end

    it 'like review' do
      expect do
        post toggle_like_review_url(review, { format: :turbo_stream })
      end.to change(Like, :count).by(1)
    end

    it 'unlike review' do
      create(:like_of_review, user:, likable: review)

      expect do
        post toggle_like_review_url(review, { format: :turbo_stream })
      end.to change(Like, :count).by(-1)
    end
  end
end
