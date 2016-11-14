class PagesController < ApplicationController

  # GET /pages
  # GET /pages.json
  def index
    @recipes = Recipe.order("RANDOM()").first(20)
  end

end
