class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable

  EMAIL_REGEX=/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  NAME_REGEX=/\A[A-Z]\w+|\A[A-Z]\w+\s[A-Z]\w+/
  PASSWORD_REGEX=/\A\w+\z/i
  has_many :raitings
  has_many :hotels
  validates :name, presence: true, format: NAME_REGEX#, uniqueness: true
  validates :email, presence: true, format: EMAIL_REGEX, uniqueness: true
  validates :password, length: { minimum: 5 }, presence: true, format:PASSWORD_REGEX

  def rate_hotel_by_value(hotel, value)
    self.raitings.build( hotel_id: hotel.id, value: value)
  end

  def rate_hotel_by_value!(hotel, value)
    this_rate=rate_hotel_by_value(hotel, value)

    if this_rate.valid?
      this_rate.save
      this_rate
    end
  end
end