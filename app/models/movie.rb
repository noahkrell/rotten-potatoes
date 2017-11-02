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
  has_many :genres, through: :genre_movies

  def self.search(search)
    where("title ILIKE ? OR director ILIKE ?", "%#{search}%", "%#{search}%")
  end
end
