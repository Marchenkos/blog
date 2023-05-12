class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end

  def show
    @review = Review.find_by(id: review_params[:id])

    @review.punch(request)
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

  private

  def create_review_params
    params.require(:review).permit(:title, :book_name, :author, :body, :cover)
  end

  def review_params
    params.permit(:id)
  end
end
