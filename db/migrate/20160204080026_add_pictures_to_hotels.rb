class AddPicturesToHotels < ActiveRecord::Migration
  def change
    add_column :hotels, :pictures, :json
  end
end
