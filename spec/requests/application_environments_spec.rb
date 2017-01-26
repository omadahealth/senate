require 'rails_helper'

RSpec.describe "ApplicationEnvironments", type: :request do
  describe "GET /application_environments" do
    it "works! (now write some real specs)" do
      get application_environments_path
      expect(response).to have_http_status(200)
    end
  end
end
