require "spec_helper"

describe PerformancesController do
  describe "routing" do

    it "routes to #index" do
      get("/performances").should route_to("performances#index")
    end

    it "routes to #new" do
      get("/performances/new").should route_to("performances#new")
    end

    it "routes to #show" do
      get("/performances/1").should route_to("performances#show", :id => "1")
    end

    it "routes to #edit" do
      get("/performances/1/edit").should route_to("performances#edit", :id => "1")
    end

    it "routes to #create" do
      post("/performances").should route_to("performances#create")
    end

    it "routes to #update" do
      put("/performances/1").should route_to("performances#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/performances/1").should route_to("performances#destroy", :id => "1")
    end

  end
end
