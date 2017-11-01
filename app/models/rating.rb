class Rating < ApplicationRecord
  belongs_to :rateable, polymorphic: true
  belongs_to :user

  validates :user, uniqueness: { scope: :movie }
end
