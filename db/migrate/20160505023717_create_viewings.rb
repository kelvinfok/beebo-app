class CreateViewings < ActiveRecord::Migration
  def change
    create_table :viewings do |t|
      t.references :user, index: true, foreign_key: true
      t.references :house, index: true, foreign_key: true
      t.datetime :appointment_date
      t.datetime :appointment_time
      t.integer :price
      t.integer :total

      t.timestamps null: false
    end
  end
end
