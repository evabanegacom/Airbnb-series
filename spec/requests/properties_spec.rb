require 'rails_helper'

RSpec.describe "Properties", type: :request do
  describe "GET /show" do
    let(:property) { create(:property) }

    it "returns http success" do
      get property_path(property)
      expect(response).to be_successful
      expect(response).to have_http_status(:success)
    end
  end
end
