class HomeController < ApplicationController
  def index
    # fetches all images present in the database
    @images = Image.all
  end

  def filter
    @images = Image.tagged_with(params[:selected_tag])
    render :index
  end

  def destroy
    id = params[:img_id]
    image_del = Image.find(id)
    image_del.destroy
    @images = Image.all
    redirect_to root_url
  end
end
