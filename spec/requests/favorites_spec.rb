require 'rails_helper'

RSpec.describe "Favorites", type: :request do
  let(:user) { User.create(email: 'foo@test.com', password: 'yagni123')}

  let(:jwt) do
        post user_token_path, params: {auth: {email: user.email, password: user.password}}
        JSON.parse(response.body)["jwt"]
      end

  let(:jwt_header) {{'Authorization': "Bearer #{jwt}"}}

  describe "GET /favorites" do
    it "requires authentication" do
      get favorites_path
      expect(response).to have_http_status(401)
    end

    describe "with authentication" do
      it "returns 200" do
        get(favorites_path, headers: jwt_header)
        expect(response).to have_http_status(200)
      end
    end
  end

  describe "POST /favorites" do
    let(:brewery) {Brewery.create}
    let(:beer) { Beer.create(brewery_db_json: {}, brewery: brewery)}

    it "requires authentication" do
      post favorites_path
      expect(response).to have_http_status(401)
    end

    describe "with auth" do
      it "adds the beer to the user's favorites" do
        post favorites_path, params: {beer_id: beer.id}, headers: jwt_header
        expect(response).to have_http_status(:created)
      end
      it "adds the beer to the user's favorites" do
        post favorites_path, params: {beer_id: beer.id}, headers: jwt_header
        beer_array = JSON.parse response.body
        expect(response).to have_http_status(:created)
      end
    end
  end
end
