# == Schema Information
#
# Table name: movies
#
#  id          :integer          not null, primary key
#  title       :string           not null
#  description :text
#  runtime     :integer
#  mpaa_rating :string
#  director    :string
#  release     :date
#  api_id      :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Movie < ApplicationRecord
  has_many :reviews
  has_many :genre_movies
  has_many :genres, through: :genre_movies
  include MoviesHelper

  def self.search(search)
    where("title ILIKE ? OR director ILIKE ?", "%#{search}%", "%#{search}%")
  end

  def average_spud_score
    review_count = self.reviews.count
    score_total = self.reviews.map(&:spud_score).inject(0, &:+)
    (score_total / review_count).to_f
  end

  def coming_soon?
    coming_soon.include?(self)
  end

  def in_theaters?
    in_theaters_now.include?(self)
  end

end
