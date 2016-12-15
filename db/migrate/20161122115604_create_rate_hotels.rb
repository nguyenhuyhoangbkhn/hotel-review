class CreateRateHotels < ActiveRecord::Migration[5.0]
  def change
    create_table :rate_hotels do |t|
      t.integer :hotel_id
      t.integer :user_id
      t.integer :admin_user_id
      t.integer :rating

      t.timestamps
    end
  end
end
