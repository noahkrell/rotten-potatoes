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
      #lists movies that came out in the last month
      if movie.release.between?(Date.today.prev_month, Date.today)
        in_theaters << movie
      end
    end
    in_theaters
  end

end
