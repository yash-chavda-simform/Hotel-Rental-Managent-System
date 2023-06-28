class CreateProperties < ActiveRecord::Migration[7.0]
  def change
    create_table :properties do |t|
      t.string :country_name
      t.string :house_name
      t.string :street_name
      t.string :city
      t.string :state
      t.string :pincode
      t.integer :property_type
      t.integer :stay_area
      t.integer :total_guest_capacity
      t.integer :total_room
      t.integer :total_bed
      t.integer :total_bathroom
      t.string :description
      t.decimal :price
      t.references :user, null: false, foreign_key: true
      t.boolean :approved

      t.timestamps
    end
  end
end
