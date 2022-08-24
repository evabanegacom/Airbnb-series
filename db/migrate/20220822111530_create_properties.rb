class CreateProperties < ActiveRecord::Migration[6.0]
  def change
    create_table :properties do |t|
      t.string :name
      t.text :description
      t.string :city
      t.string :state
      t.string :country
      t.string :headline
      t.string :address_1
      t.string :address_2

      t.timestamps
    end
  end
end
