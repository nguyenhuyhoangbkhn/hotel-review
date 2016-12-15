class CreateHotels < ActiveRecord::Migration[5.0]
  def change
    create_table :hotels do |t|
      t.string :name
      t.integer :countRoom
      t.text :introduction
      t.integer :hotel_kind
      t.string :phone_number
      t.string :website
      t.string :score_average

      t.timestamps
    end
  end
end
