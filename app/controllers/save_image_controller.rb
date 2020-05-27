require 'net/http'
require 'uri'

class SaveImageController < ApplicationController
  def new
    @image = Image.new
  end

  def create
    @image = parse_params params
    if @image.valid?
      @image.save!
      flash.alert = 'Successfully saved the image'
      redirect_to root_url
    else
      flash.alert = 'Invalid image URL'
      redirect_to save_image_new_url
    end
  end

  def parse_params(params)
    curr_url = params[:url][0]
    tags = params[:tags].split(',')
    image = Image.new(url: curr_url)
    tags.each do |tag|
      image.tag_list.add(tag)
    end
    image
  end
end
