class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.belongs_to :writer, null: false, foreign_key: {to_table: :users}
      t.string :title
      t.text :body
      t.string :author
      t.string :book_name

      t.timestamps
    end
  end
end
