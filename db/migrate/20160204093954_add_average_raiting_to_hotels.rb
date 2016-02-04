class AddAverageRaitingToHotels < ActiveRecord::Migration
  def change
    add_column :hotels, :average_raiting, :decimal
  end
end
