require 'rails_helper'

RSpec.describe "Favorites", type: :request do
  let(:user) { User.create(email: 'foo@test.com', password: 'yagni123')}
  describe "GET /favorites" do
    it "requires authentication" do
      get favorites_path
      expect(response).to have_http_status(401)
    end

    describe "with authentication" do
      let(:jwt) do
        post user_token_path, params: {auth: {email: user.email, password: user.password}}
        JSON.parse(response.body)["jwt"]
      end

      let(:jwt_header) {{'Authorization': "Bearer #{jwt}"}}
      it "returns 200" do
        get(favorites_path, headers: jwt_header)
        expect(response).to have_http_status(200)
      end
    end
  end
end
