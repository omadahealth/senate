require 'rails_helper'

RSpec.describe "Redis", type: :request do
  describe "GET /redis" do
    it "works! (now write some real specs)" do
      get redis_path
      expect(response).to have_http_status(200)
    end
  end
end
