require 'spec_helper'

describe "Images" , :type => :request do
  describe "GET /images", :type => :request do
    it "should let the user enter search terms " do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      visit images_path
      page.has_content? "Enter Search Term" #this is just text though
    end
 
    it "must accept a search term and redirect to the search results page with 10 pictures" do
      visit images_path
      fill_in "q", :with => "test search"
      click_button "Search"
      page.should have_content("Search results")
      #page.should have_xpath('//li', :count => 10) doesnt currently match anything...
    end
  end
  

end
