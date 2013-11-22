require "spec_helper"

describe GearsController do
  describe "routing" do

    it "routes to #index" do
      get("/gears").should route_to("gears#index")
    end

    it "routes to #show" do
      get("/gears/1").should route_to("gears#show", :id => "1")
    end

    it "routes to #create" do
      post("/gears").should route_to("gears#create")
    end

    it "routes to #update" do
      put("/gears/1").should route_to("gears#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/gears/1").should route_to("gears#destroy", :id => "1")
    end

  end
end
