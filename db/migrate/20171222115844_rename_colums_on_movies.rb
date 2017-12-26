class RenameColumsOnMovies < ActiveRecord::Migration[5.1]
  def change
    rename_column :movies, :scriptwriter, :writer
    rename_column :movies, :cast, :star
    add_index :movies, :jp_title, unique: true
    add_index :movies, :en_title, unique: true
  end
end
