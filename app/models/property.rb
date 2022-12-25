class Property < ApplicationRecord
  validates :name, presence: true
  after_validation :geocode, if: -> { longitude.blank? && latitude.blank? }

  monetize :price_cents, allow_nil: true

  has_many :reviews, as: :reviewable

  has_many_attached :images, dependent: :destroy

  has_many :favorites, dependent: :destroy

  has_many :favorited_users, through: :favorites, source: :user

  geocoded_by :address

  has_many :reservations, dependent: :destroy
  has_many :reserved_users, through: :reservations, source: :user

  # def average_rating
  #   reviews.average(:rating)
  # end

  def address
    [state, country].compact.join(',')
  end

  def default_image
    images.first
  end

  def favorited_by?(user)
    return if user.nil?

    favorited_users.include?(user)
  end

  def available_dates
    next_reservation = reservations.where('reservation_date > ?', Date.today).order(:reservation_date).first
    date_format = '%b %e'

    return Date.tomorrow.strftime(date_format)..Date.today.end_of_year.strftime(date_format) if next_reservation.nil?

    Date.tomorrow.strftime(date_format)..next_reservation.reservation_date.strftime(date_format)
  end
end
