class Raiting < ActiveRecord::Base
  belongs_to :user
  belongs_to :hotel
  validates_numericality_of :value, on: :create, greater_than: 0, less_than_or_equal_to: 5
  validates_uniqueness_of :user_id, scope: :hotel_id
  validates_presence_of :value, :user_id, :hotel_id
end
