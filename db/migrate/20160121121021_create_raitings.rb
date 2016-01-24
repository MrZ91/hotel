class CreateRaitings < ActiveRecord::Migration
  def change
    create_table :raitings do |t|
      t.column :user_id, :integer
      t.column :hotel_id, :integer
      t.column :value, :integer
    end
  end
end
