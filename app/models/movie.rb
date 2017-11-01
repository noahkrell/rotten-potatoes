class Movie < ApplicationRecord
  has_many :reviews
  has_many :genres, through: :genre_movies
  has_many :ratings, as: :rateable
end
