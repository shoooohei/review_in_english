class CreateUserIcons < ActiveRecord::Migration[5.1]
  def change
    create_table :user_icons do |t|
      t.references :user, foreign_key: true
      t.text :image

      t.timestamps
    end
  end
end
