class Hotel < ActiveRecord::Base
  has_one :adress
  belongs_to :user
  has_many :raitings
  validates_presence_of :title, :room_description, :price_for_room, :user_id
  validates_uniqueness_of :title
  accepts_nested_attributes_for :adress
 # default_scope -> { order('average_raiting DESC') }
  mount_uploaders :pictures, HotelPicsUploader

def average_raiting
  sum_value=0
  if self.raitings.count>0
   self.raitings.each do |t|
    sum_value+=t.value
   end
   sum_value.to_f/self.raitings.count.to_f
  else
  sum_value.to_f
  end
end
  end