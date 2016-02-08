class AddPicturesToHotels < ActiveRecord::Migration
  def change
    add_column :hotels, :pictures, :text
  end
end
