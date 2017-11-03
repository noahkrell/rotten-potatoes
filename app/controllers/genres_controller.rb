class GenresController < ApplicationController

  def index
    @genres = Genre.all
  end

  def show
    @movies_in_genre = Tmdb::Genre.movies(params[:id]).results
    @genre = nil
    Tmdb::Genre.movie_list.find do |genre|
      if genre.id == params[:id].to_i
        @genre = genre.name
      end
    end
    @genre
  end

end
