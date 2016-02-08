class Hotel < ActiveRecord::Base
  has_one :adress
  belongs_to :user
  has_many :raitings
  validates_presence_of :title, :room_description, :price_for_room, :user_id
  validates_uniqueness_of :title
  accepts_nested_attributes_for :adress
  default_scope -> { order('average_raiting DESC') }
  mount_uploaders :pictures, HotelPicsUploader
  serialize :pictures, Array

  def add_average_raiting(value)
    if self.raitings.count<=1
      self.average_raiting=value
    else
      current_raiting=self.average_raiting
      self.average_raiting*=(1+(((value/current_raiting) -1)/self.raitings.count))
    end
    self.save
  end

  def remove_average_raiting(value)
    current_raiting=self.average_raiting
    self.average_raiting*=(1-(((value/current_raiting) -1)/self.raitings.count)) if
        self.raitings.count>1
    self.average_raiting=0
    self.save
  end
  end