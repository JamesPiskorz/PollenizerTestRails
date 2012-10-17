
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
  
  def self.find(searchterm="", page=1)
    @images = flickr.photos.search(:text=>searchterm, :page=>page, :per_page=>10, :extras=>"url_sq,url_o")
  end
  
  def self.paginate(searchterm="", page=1)
    imagelist = find(searchterm,page)
    @images_paginated = WillPaginate::Collection.create(page, 10, imagelist.total) do |pager|
      pager.replace(imagelist.to_a[0, 10])
    end
  end
end
