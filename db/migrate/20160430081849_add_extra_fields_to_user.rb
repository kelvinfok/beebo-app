class AddExtraFieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :mobile_number, :string
    add_column :users, :description, :text
  end
end
