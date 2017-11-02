# == Schema Information
#
# Table name: genre_movies
#
#  id         :integer          not null, primary key
#  genre_id   :integer
#  movie_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class GenreMovie < ApplicationRecord
  belongs_to :genre
  belongs_to :movie
end
