# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string           not null
#  email           :string           not null
#  password_digest :string           not null
#  username        :string           not null
#  critic          :boolean
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord
  has_many :votes
  has_many :reviews

  # before_save { username.downcase }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, :username, :name, presence: true
  validates_uniqueness_of :name, :email, :case_sensitive => false
  validates :email, format: { with: VALID_EMAIL_REGEX }

  has_secure_password

 #  def password_is_not_blank(new_password)
 #   new_password.blank?
 # end

 #  def password
 #    @password ||= BCrypt::Password.new(password_hash)
 #  end

 #  def password=(new_password)
 #    if password_is_not_blank(new_password)
 #      @password = BCrypt::Password.create(new_password)
 #      self.password_hash = @password
 #    else
 #      errors.add(:password, "must not be blank")
 #    end
 #  end

 #  def authenticate(inputted_password)
 #    self.password == inputted_password
 #  end

end
