class CreateReviewVisits < ActiveRecord::Migration[7.0]
  def change
    create_table :review_visits do |t|
      t.belongs_to :user, null: true, foreign_key: { to_table: :users }
      t.belongs_to :review, null: false, foreign_key: { to_table: :reviews }

      t.timestamps
    end
  end
end
