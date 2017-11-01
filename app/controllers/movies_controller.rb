class MoviesController < ApplicationController
  include MoviesHelper
  def index
    @coming_soon = coming_soon
    @in_theaters = in_theaters_now
    @genres = Genre.all
  end

  def show
    @movie = Movie.find(params[:id])
  end

end
