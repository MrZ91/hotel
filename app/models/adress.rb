class Adress < ActiveRecord::Base
  validates_presence_of :country, :state, :city, :street
  validates_uniqueness_of :street#, scope: :hotel_id
end
