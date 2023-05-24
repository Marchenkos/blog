class ReviewsController < ApplicationController
  include TrackReviewVisits

  before_action :authenticate_user!, only: %i[new create toggle_like]
  before_action :track_visit, only: :show

  def index
    @reviews = Review.all
  end

  def show
    @review = Review.find_by(id: review_params[:id])
  end

  def new
    @review = Review.new
  end

  def create
    @review = current_user.reviews.build(create_review_params)

    if @review.save
      flash[:notive] = 'Review was successfully created'
      redirect_to account_index_path
    else
      render 'new'
    end
  end

  def toggle_like
    @review = Review.find_by(id: review_params[:id])
    LikesService.toggle_like(likable: @review)

    @review.reload
  end

  private

  def create_review_params
    params.require(:review).permit(:title, :book_name, :author, :body, :cover)
  end

  def review_params
    params.permit(:id)
  end
end
