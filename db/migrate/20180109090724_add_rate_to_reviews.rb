class AddRateToReviews < ActiveRecord::Migration[5.1]
  def change
    add_column :reviews, :rate, :integer, default: 0
  end
end
