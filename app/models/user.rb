class User < ApplicationRecord
  has_many :votes
  has_many :reviews


  validates :email, :username, :name, presence: true
  validates :email, :username, uniqueness: true
  # validates_length_of :password_hash, :minimum => 1

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
