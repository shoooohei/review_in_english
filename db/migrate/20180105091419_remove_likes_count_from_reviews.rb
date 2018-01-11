class RemoveLikesCountFromReviews < ActiveRecord::Migration[5.1]
  def change
    remove_column :reviews, :likes_count
    add_column :reviews, :likes_count, :integer, default: 0
  end
end
