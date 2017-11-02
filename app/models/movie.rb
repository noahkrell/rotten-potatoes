class Movie < ApplicationRecord
  has_many :reviews
  has_many :genres, through: :genre_movies
  has_many :ratings, as: :rateable

  def self.search(search)
    where("title ILIKE ? OR director ILIKE ?", "%#{search}%", "%#{search}%")
  end
end
