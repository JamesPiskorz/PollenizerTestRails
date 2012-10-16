require 'spec_helper'

describe Image do
  it "has a find method" do
   Image.should respond_to(:find)
  end
  it "has a find method that can be empty" do
    Image.find().should be_valid
  end
  
  it "has a find method that can be passed a search string" do
    Image.find("searchterm").should be_valid
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
