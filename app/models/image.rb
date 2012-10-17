class Image
 include ActiveModel::Validations
 include ActiveModel::Conversion
 extend ActiveModel::Naming
  attr_accessor :title, :desc, :url_thumb ,:url_large
  
  def persitant?
    return false
  end
  
  def initialize(attributes={})
    attributes.each do |key, value|
      send("#{key}=",value)    
    end
  end
  
  def self.all
    @images = {}
  end
  
  def self.find
    @images
  end
end
