class CreateRaitings < ActiveRecord::Migration
  def change
    create_table :raitings do |t|
      t.column :rater, :integer, unique: true
      t.column :hotel, :integer, unique: true
      t.column :raiting, :integer, unique: true
      t.timestamps
    end
  end
end
