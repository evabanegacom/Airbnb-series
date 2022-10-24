FactoryBot.define do
  factory :profile do
    user { nil }
    address_1 { 'MyString' }
    address_2 { 'MyString' }
    city { 'MyString' }
    state { 'MyString' }
    country { 'MyString' }
    longitude { 1.5 }
    latitude { 1.5 }
  end
end
