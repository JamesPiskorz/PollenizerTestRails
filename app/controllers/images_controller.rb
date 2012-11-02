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
    #if the page is not specified then we assume we're showing the first page.
    if params[:page].nil? then
      params[:page]=1
    end

    @images_paginated = Image.paginate(params[:q],params[:page])
    @query = params[:q]

  end

end
