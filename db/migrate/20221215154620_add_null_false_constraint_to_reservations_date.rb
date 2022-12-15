class AddNullFalseConstraintToReservationsDate < ActiveRecord::Migration[6.0]
  def change
    change_column_null :reservations, :reservation_date, false
  end
end
