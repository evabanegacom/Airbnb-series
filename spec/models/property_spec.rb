require 'rails_helper'

RSpec.describe Property, type: :model do
  it { should validate_presence_of(:name)}
  it {is_expected.to monetize(:price).allow_nil}
end
