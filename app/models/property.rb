class Property < ApplicationRecord
  validates :name, presence: true
  after_validation :geocode, if: -> { longitude.blank? && latitude.blank? }

  monetize :price_cents, allow_nil: true

  has_many :reviews, as: :reviewable

  has_many_attached :images, dependent: :destroy

  has_many :favorites, dependent: :destroy

  has_many :favorited_users, through: :favorites, source: :user

  geocoded_by :address

  # def average_rating
  #   reviews.average(:rating)
  # end

  def address
    [state, country].compact.join(',')
  end

  def default_image
    images.first
  end
end
