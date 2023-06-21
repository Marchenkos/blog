class AddReviewFieldsValidation < ActiveRecord::Migration[7.0]
  def change
    change_column :reviews, :title, :string, :null => false
    change_column :reviews, :body, :string, :null => false
    change_column :reviews, :author, :string, :null => false
    change_column :reviews, :book_name, :string, :null => false
  end
end
