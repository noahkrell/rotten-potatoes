class MoviesController < ApplicationController

  include MoviesHelper
  # include Tmdb

  def index
    @coming_soon = Tmdb::Movie.upcoming.results
    @in_theaters = Tmdb::Movie.now_playing.results
    @genres = Tmdb::Genre.movie_list
    if params[:search]
      Movie.all.each do |movie|
        movie_api_id = movie.api_id
        movie_details = Tmdb::Movie.detail(movie_api_id)
        if movie_details.title.downcase.include?(params[:search].downcase)
          puts movie_details.title
        end
      end
    end
  end

  def show
    @movie = Tmdb::Movie.detail(params[:id])
    @reviews = Movie.find_by(api_id: @movie.id).reviews
  end
end
