class CreateProvincials < ActiveRecord::Migration[5.0]
  def change
    create_table :provincials do |t|
      t.string :name
      t.string :ordinate
      t.integer :province_kind

      t.timestamps
    end
  end
end
