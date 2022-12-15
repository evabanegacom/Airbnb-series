require 'rails_helper'

RSpec.describe Property, type: :model do
  it { should validate_presence_of(:name) }
  it { is_expected.to monetize(:price).allow_nil }
  it { should have_many(:reviews) }
  it { should have_many(:reservations).dependent(:destroy) }
  it { should have_many(:reserved_users).through(:reservations).source(:user) }
end
