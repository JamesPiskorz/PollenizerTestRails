#Our image does NOT inherite from active record because we dont save to the DB infact there is no persistance to it
#instead we will implement several parts of the ActieModel allow some functionality out of the box.
class Image

  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming
  
  def persitant?
    return false
  end

  def self.all
    @images = {}
  end

  def self.find(id)
    @image = flickr.photos.getSizes(:photo_id=>id)
  end

  def self.search(searchterm="", page=1)
    @images = flickr.photos.search(:text=>searchterm, :page=>page, :per_page=>10, :extras=>"url_sq,url_o")
  end

  def self.paginate(searchterm="", page=1)
    imagelist = search(searchterm,page)
    # we use the will_paginate gem to manage all of our pagination. Except we are responsible for fetching new data.
    @images_paginated = WillPaginate::Collection.create(page, 10, imagelist.total) do |pager|
      pager.replace(imagelist.to_a[0, 10])
    end
  end
  
end
