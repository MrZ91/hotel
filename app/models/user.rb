class User < ActiveRecord::Base
  before_save{self.email=email.downcase}
  before_create :create_remember_token

  EMAIL_REGEX=/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  NAME_REGEX=/\A[A-Z]\w+|\A[A-Z]\w+\s[A-Z]\w+/
  PASSWORD_REGEX=/\A\w+\z/i
  has_many :raitings
  has_many :hotels
  validates :name, presence: true, format: NAME_REGEX, uniqueness: true
  validates :email, presence: true, format: EMAIL_REGEX, uniqueness: true
  validates :password, length: { minimum: 5 }, presence: true, format:PASSWORD_REGEX
  has_secure_password

  def rate_hotel_by_value(hotel, value)
    self.raitings.build( hotel_id: hotel.id, value: value)
  end

  def rate_hotel_by_value!(hotel, value)
      this_rate=rate_hotel_by_value(hotel, value)
      if this_rate.valid?
        this_rate.save
        this_rate
      else
        nil
      end
  end


  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

  def create_remember_token
    self.remember_token = User.encrypt(User.new_remember_token)
  end
end
