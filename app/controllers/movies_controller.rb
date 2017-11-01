class MoviesController < ApplicationController

  def index
    @movies = Movie.all
    if params[:search]
      @movies = Movie.search(params[:search]).order("created_at DESC")
    else
      @movies = Movie.all.order("created_at DESC")
    end
  end

end
