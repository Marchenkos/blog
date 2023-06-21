class ReplaceWiterRefWithUser < ActiveRecord::Migration[7.0]
  def change
    rename_column :reviews, :writer_id, :user_id
  end
end
