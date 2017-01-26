require "rails_helper"

RSpec.describe ApplicationEnvironmentsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/application_environments").to route_to("application_environments#index")
    end

    it "routes to #new" do
      expect(:get => "/application_environments/new").to route_to("application_environments#new")
    end

    it "routes to #show" do
      expect(:get => "/application_environments/1").to route_to("application_environments#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/application_environments/1/edit").to route_to("application_environments#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/application_environments").to route_to("application_environments#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/application_environments/1").to route_to("application_environments#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/application_environments/1").to route_to("application_environments#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/application_environments/1").to route_to("application_environments#destroy", :id => "1")
    end

  end
end
