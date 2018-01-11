class CreatePhrases < ActiveRecord::Migration[5.1]
  def change
    create_table :phrases do |t|
      t.references :review, foreign_key: true
      t.text :content
      t.text :comment
      t.integer :likes_count

      t.timestamps
    end
  end
end
