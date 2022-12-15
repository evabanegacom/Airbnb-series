class AddUniqueIndexToFavorites < ActiveRecord::Migration[6.0]
  def change
    add_index :favorites, %i[property_id user_id], unique: true
  end
end
