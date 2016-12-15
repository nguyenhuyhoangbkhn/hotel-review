class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.integer :hotel_id
      t.integer :user_id
      t.integer :admin_user_id

      t.timestamps
    end
  end
end
