class SetDefaultToWethercorrection < ActiveRecord::Migration[5.1]
  def change
    remove_column :corrections, :wether_correction
    add_column :corrections, :wether_correction, :boolean, default: false
  end
end
