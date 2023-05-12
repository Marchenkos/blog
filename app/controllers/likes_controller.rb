class LikesController < ApplicationController
  before_action :authenticate_user!

  def update
    review_id = update_likes[:id]
    @review = Review.find_by(id: review_id)

    if @review.liked?(user: current_user)
      Like.find_by(user_id: current_user.id, review_id:).destroy
    else
      new_like = Like.new(user_id: current_user.id, review_id:)
      new_like.save
    end

    @review.reload
  end

  def update_likes
    params.permit(:id)
  end
end
