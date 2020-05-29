class HomeController < ApplicationController
  def index
    # fetches all images present in the database
    @images = Image.all
  end

  def filter
    @images = Image.tagged_with(params[:selected_tag])
    render :index
  end
end
