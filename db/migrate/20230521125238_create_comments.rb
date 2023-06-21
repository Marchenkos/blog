class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.text :body, null: false

      t.belongs_to :user, null: false, foreign_key: { to_table: :users }
      t.belongs_to :commentable, null: true, polymorphic: true

      t.integer :likes_count, default: 0

      t.timestamps
    end
  end
end
