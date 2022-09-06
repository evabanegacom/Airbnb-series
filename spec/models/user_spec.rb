require 'rails_helper'

RSpec.describe User, type: :model do
  it { has_one(:profile).dependent(:destroy)}
end
