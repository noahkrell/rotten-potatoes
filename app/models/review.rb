# == Schema Information
#
# Table name: reviews
#
#  id          :integer          not null, primary key
#  description :text
#  movie_id    :integer          not null
#  user_id     :integer          not null
#  spud_score  :decimal(, )      not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Review < ApplicationRecord
  belongs_to :movie
  belongs_to :user
  has_many :votes

  validates :spud_score, presence: true
  validates :user, uniqueness: { scope: :movie }
end
