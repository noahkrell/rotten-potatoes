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

require 'test_helper'

class GenreMovieTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
