class Review < ApplicationRecord
  belongs_to :reviewable, polymorphic: true, counter_cache: true
  after_commit :update_average_rating, on: %i[create update]
  validates :rating, presence: true,
                     numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5, only_integer: true }

  def update_average_rating
    reviewable.update!(average_rating: reviewable.reviews.average(:rating))
  end
end
