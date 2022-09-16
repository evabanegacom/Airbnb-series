class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.references :user, null: false, foreign_key: true
      t.string :address_1
      t.string :address_2
      t.string :city
      t.string :state
      t.string :country
      t.float :longitude
      t.float :latitude
      t.string :zipcode

      t.timestamps
    end
  end
end
