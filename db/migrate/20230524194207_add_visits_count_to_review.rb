class AddVisitsCountToReview < ActiveRecord::Migration[7.0]
  def change
    add_column :reviews, :review_visits_count, :integer, default: 0
  end
end
