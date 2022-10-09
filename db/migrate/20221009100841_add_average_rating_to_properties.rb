class AddAverageRatingToProperties < ActiveRecord::Migration[6.0]
  def change
    add_column :properties, :average_rating, :decimal
  end
end
