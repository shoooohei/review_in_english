class CreateClikes < ActiveRecord::Migration[5.1]
  def change
    create_table :clikes do |t|
      t.references :user, foreign_key: true
      t.references :correction, foreign_key: true
      t.integer :LikesCount

      t.timestamps
    end
  end
end
