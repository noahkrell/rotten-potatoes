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

# in_theaters = Tmdb::Movie.now_playing.results
# upcoming_movies = Tmdb::Movie.upcoming.results


# in_theaters.each do |movie|
#   movie = Movie.create( api_id: movie.id )
# end

# upcoming_movies.each do |movie|
#   movie = Movie.create( api_id: movie.id )
# end


genres = [28,12,16,35,80,99,18,10751,14,36,27,10402,9648,10749,878,10770,53,10752,37]
movies = []
genres.each do |genre_id|
  movies += Tmdb::Genre.movies(genre_id).results
end
movies.each do |movie|
  Movie.create(api_id: movie.id)
end
# users

1000.times do
  User.create( name:Faker::Name.name,
                      username: Faker::Internet.user_name,
                      email: Faker::Internet.safe_email,
                      password: 'password',
                      critic: [true, false].sample )
end

# reviews

# 100.times do |i|
#   Review.create(description: Faker::Hipster.paragraph,
#                 movie_id: upcoming_movies.sample.id,
#                 user_id: i,
#                 spud_score: [1, 2, 3, 4, 5, 1.5, 2.5, 3.5, 4.5].sample)
# end

1000.times do |i|
  Review.create(description: Faker::Hipster.paragraph,
                movie_id: Movie.all.sample.id,
                user_id: i,
                spud_score: [1, 2, 3, 4, 5, 1.5, 2.5, 3.5, 4.5].sample)
end

