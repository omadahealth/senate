require 'rails_helper'

RSpec.describe "ElasticSearches", type: :request do
  describe "GET /elastic_searches" do
    it "works! (now write some real specs)" do
      get elastic_searches_path
      expect(response).to have_http_status(200)
    end
  end
end
