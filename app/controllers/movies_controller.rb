class MoviesController < ApplicationController

  include MoviesHelper
  # include Tmdb

  def index
    @coming_soon = Tmdb::Movie.upcoming.results
    @in_theaters = Tmdb::Movie.now_playing.results
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
    @movie = Tmdb::Movie.detail(params[:id])
    @reviews = Movie.find_by(api_id: @movie.id).reviews
  end

end
