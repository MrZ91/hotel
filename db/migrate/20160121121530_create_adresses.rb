class CreateAdresses < ActiveRecord::Migration
  def change
    create_table :adresses do |t|
      t.column :country, :string
      t.column :state, :string
      t.column :city, :string
      t.column :street, :string
    end
  end
end
