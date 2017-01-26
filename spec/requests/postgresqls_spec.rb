require 'rails_helper'

RSpec.describe "Postgresqls", type: :request do
  describe "GET /postgresqls" do
    it "works! (now write some real specs)" do
      get postgresqls_path
      expect(response).to have_http_status(200)
    end
  end
end
