FactoryBot.define do
  factory :reservation do
    user { nil }
    property { nil }
    reservation_date { '2022-12-15' }
  end
end
