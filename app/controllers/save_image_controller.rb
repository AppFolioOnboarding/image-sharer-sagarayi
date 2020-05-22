require 'net/http'
require 'uri'

class SaveImageController < ApplicationController
  def index
    @image = Image.new
  end

  def create_image
    curr_url = params[:url][0]
    @image = Image.new(url: curr_url)
    if @image.save
      @image = curr_url
      flash.alert = 'Successfully saved the image'
      redirect_to root_url
    else
      flash.alert = 'Invalid image URL'
      redirect_to save_image_index_url
    end
  end
end
