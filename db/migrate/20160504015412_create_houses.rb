class CreateHouses < ActiveRecord::Migration
  def change
    create_table :houses do |t|
      t.string :home_type
      t.string :room_type
      t.integer :size
      t.integer :bed_room
      t.integer :bath_room
      t.string :listing_name
      t.text :summary
      t.string :address
      t.integer :price
      t.boolean :isActive
      t.string :fee_simple
      t.string :region
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
