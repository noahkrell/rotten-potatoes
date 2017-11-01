module MoviesHelper
  def coming_soon
    upcoming = []
    all = Movie.all
    all.each do |movie|
      if movie.release > Date.today
        upcoming << movie
      end
    end
    upcoming
  end

  def by_genre
  end

  def in_theaters_now
    in_theaters = []
    all = Movie.all
    all.each do |movie|
      # this logic isn't complete
      # shows all movies release before today as 'in theaters'
      if movie.release < Date.today
        in_theaters << movie
      end
    end
    in_theaters
  end

end
