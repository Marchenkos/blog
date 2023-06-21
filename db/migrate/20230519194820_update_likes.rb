class UpdateLikes < ActiveRecord::Migration[7.0]
  def change
    add_reference :likes, :likable, polymorphic: true, null: false
    remove_column :likes, :review_id

  end
end
