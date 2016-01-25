class Raiting < ActiveRecord::Base
  belongs_to :user
  belongs_to :hotel
  validates_numericality_of :value, on: :create, greater_than: 0, less_than_or_equal_to: 5
  validates_uniqueness_of :hotel_id, scope: :user_id
  validates_presence_of :value#, :user_id, :hotel_id
end
