class AddLikescountToCorrections < ActiveRecord::Migration[5.1]
  def change
    add_column :corrections, :likes_count, :integer, default: 0
  end
end
