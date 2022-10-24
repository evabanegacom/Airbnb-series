FactoryBot.define do
  factory :favorite do
    user { User.first}
    property { Property.create(
      name: Faker::Lorem.word,
    headline: Faker::Lorem.sentence,
    description: Faker::Lorem.paragraph,
    address_1: Faker::Address.street_address,
    city: Faker::Address.city,
    state: Faker::Address.state,
    id: 100,
    country: 'United States',
    price: Money.from_amount((25..100).to_a.sample)
    ) }
  end
end
