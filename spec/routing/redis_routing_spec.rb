require "rails_helper"

RSpec.describe RedisController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/redis").to route_to("redis#index")
    end

    it "routes to #new" do
      expect(:get => "/redis/new").to route_to("redis#new")
    end

    it "routes to #show" do
      expect(:get => "/redis/1").to route_to("redis#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/redis/1/edit").to route_to("redis#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/redis").to route_to("redis#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/redis/1").to route_to("redis#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/redis/1").to route_to("redis#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/redis/1").to route_to("redis#destroy", :id => "1")
    end

  end
end
