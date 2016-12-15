class CreateDestinationAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :destination_addresses do |t|
      t.string :name
      t.integer :village_id
      t.string :address
      t.integer :hotel_id
      t.string :user_id

      t.timestamps
    end
  end
end
