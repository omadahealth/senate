require 'rails_helper'

RSpec.describe "Secrets", type: :request do
  describe "GET /secrets" do
    it "works! (now write some real specs)" do
      get secrets_path
      expect(response).to have_http_status(200)
    end
  end
end
