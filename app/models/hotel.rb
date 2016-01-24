class Hotel < ActiveRecord::Base
  has_one :adress
  belongs_to :user
  has_many :raitings
  validates_presence_of :title, :room_description, :price_for_room, :user_id
  validates_uniqueness_of :title
  #validates_associated :adress
  accepts_nested_attributes_for :adress
end
