class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :property

  validates :reservation_date, presence: true
end
