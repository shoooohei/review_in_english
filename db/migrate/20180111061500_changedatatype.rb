class Changedatatype < ActiveRecord::Migration[5.1]
  def change
    remove_column :reviews, :rate
    add_column :reviews, :rate, :float, default: 0.0
  end
end
