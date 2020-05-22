class HomeController < ApplicationController
  def index
    # fetches all images present in the database
    @images = Image.all
  end
end
