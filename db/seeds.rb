# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# movies

 # movie = Movie.new( title: "Back to the Future",
 #                    description: "this is a description for this movie.",
 #                    runtime: 100,
 #                    mpaa_rating: "R",
 #                    director: "Diem McLaughlin",
 #                    release: Date.today)
 # movie.save

upcoming_movies = Tmdb::Movie.upcoming.results
genres = Tmdb::Genre.movie_list.map { |genre| genre.name }
binding.pry


10.times do

  movie = Movie.create( title: Faker::Book.title,
                    description: Faker::Hipster.paragraph,
                    runtime: rand(90..130),
                    mpaa_rating: ["R", "PG-13", "PG", "G", "NC-17"].sample,
                    director: Faker::Name.name,
                    release: Faker::Date.between(2.years.ago, 1.year.from_now) )
end

# users

10.times do
  user = User.create( name:Faker::Name.name,
                      username: Faker::Internet.user_name,
                      email: Faker::Internet.safe_email,
                      password: 'password',
                      critic: [true, false].sample )
end

# genres
genre = ["Drama", "Action", "Horror", "Comedy", "Documentary", "SciFi"]

  genre.each do |genre|
    Genre.create(name: genre)
  end


# genre_movies
10.times do |i|
  GenreMovie.create( movie_id: i,
                    genre_id: rand(1..6))
end

# reviews

10.times do |i|
  Review.create(description: Faker::Hipster.paragraph,
                movie_id: i,
                user_id: i,
                spud_score: [1, 2, 3, 4, 5, 1.5, 2.5, 3.5, 4.5].sample)
end

# votes

Vote.create(user_id: 1,
            review_id: 2)

Vote.create(user_id: 3,
            review_id: 2)

Vote.create(user_id: 2,
            review_id: 4)

Vote.create(user_id: 2,
            review_id: 5)
