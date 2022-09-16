class AddGeolocationIndexToProperties < ActiveRecord::Migration[6.0]
  def change
    add_column :properties, :longitude, :float
    add_column :properties, :latitude, :float
    add_index :properties, [:latitude, :longitude]
    add_column :properties, :zipcode, :string
  end
end
