class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end

  def new
    @review = Review.new
  end

  def create
    @review = current_user.reviews.build(review_params)

    if @review.save
      flash[:notive] = 'Review was successfully created'
      redirect_to account_index_path
    else
      render 'new'
    end
  end

  private

  def review_params
    params.require(:review).permit(:title, :book_name, :author, :body, :cover)
  end
end
