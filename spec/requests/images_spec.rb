require 'spec_helper'

describe "Images" do
  describe "GET /images" do
    it "should let the user enter search terms " do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get images_path
      response.status.should be(200)
      page.has_content? "Enter Search Term" #this is just text though
    end
  end
end
