class ImagesController < ApplicationController
  # GET /images
  # GET /images.json
  def index
   # @images = Image.all()

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @images }
    end
  end

  # GET /images/1
  # GET /images/1.json
  def show
    @image = Image.find(params[:id]).paginate(:page => params[:page], :per_page => 30)


    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @image }
    end
  end
  
  def search
   # params[:q]
  end

 end
