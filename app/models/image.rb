#Our image does NOT inherite from active record because we dont save to the DB infact there is no persistance to it
#instead we will implement several parts of the ActieModel allow some functionality out of the box.
class Image

  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming
  
  attr_accessor :id
  
  def thumbnail
    return flickr.photos.getSizes(:photo_id=>id)[0].source
    
  end
  def fullsize
    return flickr.photos.getSizes(:photo_id=>id)[-1].source
  end
  
  def persitant?
    return false
  end

  def self.all
    @images = {}
  end

  def self.find(id)
    return Image.new(:id => id)
  end

  def self.paginate(searchterm="", page=1)
    flickrimagelist = flickr.photos.search(:text=>searchterm, :page=>page, :per_page=>10)
    images = Array.new
    flickrimagelist.each do |each|
      images.push(Image.new(:id=>each.id))     
    end
    # we use the will_paginate gem to manage all of our pagination. We are responsible for fetching new data, telling it the total items left and the page we are on..
    images_paginated = WillPaginate::Collection.create(page, 10, flickrimagelist.total) do |pager|
      pager.replace(images.to_a[0,10])
    end
    return images_paginated
  end
  
  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end
  
end