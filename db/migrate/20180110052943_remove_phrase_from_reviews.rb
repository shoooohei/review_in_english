class RemovePhraseFromReviews < ActiveRecord::Migration[5.1]
  def change
    remove_column :reviews, :phrase
  end
end
