class ImagesController < ApplicationController
  # GET /images
  def index

  end

  # GET /images/1
  def show
    @image = Image.find(params[:id])
   
  end
  # GET images/search?q=hey&commit=Search
  def search
   # i feel this is a little hacky... can the page be nil checked in the paginate method
   if params[:page].nil? then
     params[:page]=1
   end
   
   @images_paginated = Image.paginate(params[:q],params[:page])
   @query = params[:q] 
 
  end

 end
