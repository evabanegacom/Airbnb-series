class Property < ApplicationRecord
    validates :name, presence: true
    after_validation :geocode, if: ->{ longitude.blank? && latitude.blank? }
    
    geocoded_by :address

    def address
      [state, country].compact.join(',')
    end
end
