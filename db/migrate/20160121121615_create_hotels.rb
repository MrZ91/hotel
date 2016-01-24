class CreateHotels < ActiveRecord::Migration
  def change
    create_table :hotels do |t|
      t.column :title, :string
      t.column :room_description, :text
      t.column :price_for_room, :decimal
      t.column :breakfast, :boolean

      t.timestamps
    end
  end
end
