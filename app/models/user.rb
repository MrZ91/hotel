class User < ActiveRecord::Base
  EMAIL_REGEX=/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  NAME_REGEX=/\A[A-Z]\w+|\A[A-Z]\w+\s[A-Z]\w+/
  PASSWORD_REGEX=/\A\w+\z/i
  has_many :raitings
  has_many :hotels
  validates :name, presence: true, format: NAME_REGEX
  validates :email, presence: true, format: EMAIL_REGEX
  validates :password, length: { minimum: 5 }, presence: true, format:PASSWORD_REGEX
  has_secure_password

  def rate!(hotel, value)
    this_rate=Raiting.new(user_id: self.id, hotel_id: hotel, value: value)
    this_rate.save if this_rate.valid?
  end
end
