class Raiting < ActiveRecord::Base
  after_create do
    current_raiting=self.hotel.average_raiting||self.value
    self.hotel.average_raiting*=
          1+(((self.value/current_raiting) -1)/self.hotel.raitings.count) if
        self.hotel.raitings.count>1
  end

  before_destroy do
    self.hotel.average_raiting*=
        1-(((self.value/current_raiting) -1)/self.hotel.raitings.count) if
        self.hotel.raitings.count>1
    self.hotel.average_raiting=0
  end

  belongs_to :user
  belongs_to :hotel
  validates_numericality_of :value, on: :create, greater_than: 0, less_than_or_equal_to: 5
  validates_uniqueness_of :hotel_id, scope: :user_id
  validates_presence_of :value#, :user_id, :hotel_id
end
