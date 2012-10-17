require 'spec_helper'

describe Image do
  it "has a find method" do
   Image.should respond_to(:find)
  end
  
  it "has a search method" do
   Image.should respond_to(:search)
  end
  
  it "has a search method that returns images" do
    Image.search("test").count>=1
  end
  
  it "has a find method that brings back some urls" do
    Image.find(8097322850)[0].source.should_not nil
  end
  
  it "has a find method that can be passed a search string" do
    Image.search("searchterm").should_not nil
  end
  
  it "has a search method that brings back one or more objects with the url_sq property" do
    Image.search("test")[0].url_sq.should_not nil
  end
  
  it "shouldnt have a create method" do
    Image.should_not respond_to(:create)
  end
  it "shouldnt have a save method (because it isnt persistant)" do
    Image.should_not respond_to(:save)
  end
  it "shouldnt have a destroy method" do
    Image.should_not respond_to(:destroy)
  end
end
