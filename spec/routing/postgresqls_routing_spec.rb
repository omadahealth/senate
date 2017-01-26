require "rails_helper"

RSpec.describe PostgresqlsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/postgresqls").to route_to("postgresqls#index")
    end

    it "routes to #new" do
      expect(:get => "/postgresqls/new").to route_to("postgresqls#new")
    end

    it "routes to #show" do
      expect(:get => "/postgresqls/1").to route_to("postgresqls#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/postgresqls/1/edit").to route_to("postgresqls#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/postgresqls").to route_to("postgresqls#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/postgresqls/1").to route_to("postgresqls#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/postgresqls/1").to route_to("postgresqls#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/postgresqls/1").to route_to("postgresqls#destroy", :id => "1")
    end

  end
end
