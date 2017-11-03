class MoviesController < ApplicationController

  include MoviesHelper
  # include Tmdb

  def index
    @coming_soon = coming_soon
    @in_theaters = in_theaters_now
    @genres = Tmdb::Genre.movie_list
    if params[:search]
      # @movies = Movie.all
      @movies = Movie.search(params[:search]).order("created_at DESC")
      # binding.pry
    # else
    #   @movies = Movie.all.order("created_at DESC")
    end
  end

  def show
    @movie = Movie.find(params[:id])
  end
end
