class User < ApplicationRecord
  has_many :ratings
  has_many :reviews


  validates :email, :username, :name, :password_hash, presence: true
  validates :email, :username, uniqueness: true

  def password
    @password ||= BCrypt::Password.new(password_hash)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.password_hash = @password
  end

  def authenticate(inputted_password)
    self.password == inputted_password
  end

end
