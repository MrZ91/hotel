class CreateHotels < ActiveRecord::Migration
  def change
    create_table :hotels do |t|
      t.column :title, :string
      t.column :room_description, :string
      #t.index :picture_id, unique: true
      t.column :price_for_room, :decimal
      t.timestamps
    end
  end
end
