class CreateMovies < ActiveRecord::Migration[5.1]
  def change
    create_table :movies do |t|
      t.string :jp_title
      t.string :en_title
      t.text :image
      t.text :cast
      t.string :director
      t.string :scriptwriter
      t.integer :playyear
      t.string :country
      t.text :imdb

      t.timestamps
    end
  end
end
