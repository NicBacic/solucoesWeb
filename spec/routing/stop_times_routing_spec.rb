require "rails_helper"

RSpec.describe StopTimesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/stop_times").to route_to("stop_times#index")
    end

    it "routes to #new" do
      expect(:get => "/stop_times/new").to route_to("stop_times#new")
    end

    it "routes to #show" do
      expect(:get => "/stop_times/1").to route_to("stop_times#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/stop_times/1/edit").to route_to("stop_times#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/stop_times").to route_to("stop_times#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/stop_times/1").to route_to("stop_times#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/stop_times/1").to route_to("stop_times#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/stop_times/1").to route_to("stop_times#destroy", :id => "1")
    end

  end
end
