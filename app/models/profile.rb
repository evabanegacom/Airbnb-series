class Profile < ApplicationRecord
  belongs_to :user

  after_validation :geocode, if: ->{ address.present? && longitude.blank? && latitude.blank? }
    
    geocoded_by :address

    def address
      #[address_1, address_2, city, state, zipcode, country].compact.join(',')
      [state, country].compact.join(',')
    end
end
