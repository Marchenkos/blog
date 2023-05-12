class AddLikesCountToReview < ActiveRecord::Migration[7.0]
  def change
    add_column :reviews, :likes_count, :integer, :default => 0

    Review.find_each
  end
end
