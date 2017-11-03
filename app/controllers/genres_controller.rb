class GenresController < ApplicationController


  def show
    @movies_in_genre = Tmdb::Genre.movies(params[:id]).results
    # @movies_in_genre = Tmdb::Genre.movies(params[:id])
    # binding.pry
    @genre = nil
    Tmdb::Genre.movie_list.find do |genre|
      if genre.id == params[:id].to_i
        @genre = genre.name
      end
    end
    @genre
  end

end
