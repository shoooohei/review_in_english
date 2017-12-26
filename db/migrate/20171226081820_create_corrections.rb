class CreateCorrections < ActiveRecord::Migration[5.1]
  def change
    create_table :corrections do |t|
      t.text :content
      t.references :review
      t.references :user
      t.boolean :wether_correction

      t.timestamps
    end
  end
end
