class ImagesController < ApplicationController
  # GET /images
  # GET /images.json
  def index
    @images = Image.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @images }
    end
  end

  # GET /images/1
  # GET /images/1.json
  def show
    @image = Image.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @image }
    end
  end
  
  
  def new
    @image = Image.new()
  end
  
  def create
    @image = Image.new(params[:message])
    if @image.isvalid?
      flash[:notice] = "Image created"
      redirect_to root_url
    else
      render :action => "new"
    end    
  end


 end
