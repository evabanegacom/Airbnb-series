require 'rails_helper'

RSpec.describe 'Api::Favorites', type: :request do
  let(:headers) do
    { 'ACCEPT' => 'application/json' }
  end

  let(:user) { create(:user) }
  let(:property) { create(:property) }

  before { sign_in user }
  describe 'POST create' do
    let(:params) do
      {
        user_id: user.id,
        property_id: property.id
      }
    end

    it 'creates new favorite' do
      expect do
      end
      expect do
        post api_favorites_path, params: params, headers: headers
      end.to change(Favorite, :count).by(1)
      expect(response.status).to eq 201
    end
  end
end
