module Reviews
  class CommentsController < ApplicationController
    before_action :authenticate_user!, only: %i[create toggle_like]
    before_action :get_review, only: %i[index new create]

    def index
      @comments = @review.comments
    end

    def new
      @comment = Comment.new
    end

    def create
      @comment = Comment.new(commentable: @review, body: create_comment_params[:body], user: current_user)
      @comment.save
    end

    def toggle_like
      @comment = Comment.find(params[:id])

      LikesService.toggle_like(likable: @comment)
    end

    private

    def get_review
      @review = Review.find(params[:review_id])
    end

    def create_comment_params
      params.require(:comment).permit(:body, :review_id)
    end
  end
end
