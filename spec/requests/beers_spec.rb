require 'rails_helper'

RSpec.describe "Beers", type: :request do
  describe "GET /beers" do
    it "returns ok" do
      get beers_path
      expect(response).to have_http_status(200)
    end
  end
end
