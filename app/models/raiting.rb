class Raiting < ActiveRecord::Base
  after_save do
   self.hotel.add_average_raiting(self.value)
  end

  before_destroy do
    self.hotel.remove_average_raiting(self.value)
  end

  belongs_to :user
  belongs_to :hotel
  validates_numericality_of :value, on: :create, greater_than: 0, less_than_or_equal_to: 5
  validates_uniqueness_of :hotel_id, scope: :user_id
  validates_presence_of :value#, :user_id, :hotel_id

  def exist?
    Raiting.find_by(hotel_id: self.hotel_id, user_id: self.user_id)!=nil
  end
end
