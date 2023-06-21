class AddCommentsCountToReview < ActiveRecord::Migration[7.0]
  def change
    add_column :reviews, :comments_count, :integer, default: 0
  end
end
