module MoviesHelper
  def coming_soon
    upcoming = []
    all = Movie.all
    all.each do |movie|
      if movie > Date.today
        upcoming << movie
      end
    end
    upcoming
  end

  def convert_to_ours(movie)
    Movie.find_by(api_id: movie.id)
  end

  def convert_to_tmd(movie)
    Tmdb::Movie.detail(movie.api_id)
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

  def in_theaters?
    release_date.to_date.between?(Date.today.prev_month, Date.today)
  end

end
