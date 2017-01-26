require "rails_helper"

RSpec.describe ElasticSearchesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/elastic_searches").to route_to("elastic_searches#index")
    end

    it "routes to #new" do
      expect(:get => "/elastic_searches/new").to route_to("elastic_searches#new")
    end

    it "routes to #show" do
      expect(:get => "/elastic_searches/1").to route_to("elastic_searches#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/elastic_searches/1/edit").to route_to("elastic_searches#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/elastic_searches").to route_to("elastic_searches#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/elastic_searches/1").to route_to("elastic_searches#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/elastic_searches/1").to route_to("elastic_searches#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/elastic_searches/1").to route_to("elastic_searches#destroy", :id => "1")
    end

  end
end
