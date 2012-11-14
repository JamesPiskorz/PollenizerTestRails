require 'spec_helper'

describe Image do
  it "has a find method" do
   Image.should respond_to(:find)
  end
  
  it "has a paginate method" do
   Image.should respond_to(:paginate)
  end
  
  it "has a paginate method that returns images (and allows searching)" do
    Image.paginate("test").count>=1
  end
  
  it "has a find method that brings back something" do
    Image.find(8097322850).should_not nil
  end
  
  it "has a find method that brings back something from which we can access both the thumbnail and the whole image" do
    Image.find(8097322850).thumbnail.should_not nil
    Image.find(8097322850).fullsize.should_not nil
  end
  
  it "has a find method that can be passed a search string" do
    Image.paginate("searchterm").should_not nil
  end
  
  it "has a thumbnail property" do
    Image.paginate("test")[0].thumbnail.should_not nil
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

