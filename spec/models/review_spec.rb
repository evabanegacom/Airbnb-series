require 'rails_helper'

RSpec.describe Review, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  it { should belong_to(:reviewable) }
  it { should validate_numericality_of(:rating).is_greater_than_or_equal_to(1) }
  it { should validate_numericality_of(:rating).is_less_than_or_equal_to(5) }
  it { should validate_numericality_of(:rating).only_integer }
end
