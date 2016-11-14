class PagesController < ApplicationController

  # GET /pages
  # GET /pages.json
  def index
    @recipes_recent = Recipe.first(20)
    @recipes_random = Recipe.order("RANDOM()").first(20)
    @recipes_rated = Recipe.last(20)
  end

end
