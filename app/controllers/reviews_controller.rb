class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.writer = current_user

    if @review.save
      flash[:notive] = 'Review was successfully created'
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def review_params
    params.require(:review).permit(:title, :book_name, :author, :body, :cover)
  end
end
