class AddUniqueIndexToReservation < ActiveRecord::Migration[6.0]
  def change
    add_index :reservations, [:property_id, :user_id, :reservation_date], unique: true, name: 'idx_reserve_on_property_id_and_user_id_and_reserve_date'
  end
end
