class Review < ApplicationRecord
  belongs_to :movie
  belongs_to :user
  has_many :ratings, as: :rateable

  validates :user, uniqueness: { scope: :movie }
end
