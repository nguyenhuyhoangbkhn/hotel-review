class CreateDistricts < ActiveRecord::Migration[5.0]
  def change
    create_table :districts do |t|
      t.string :name
      t.string :ordinate
      t.integer :district_kind
      t.integer :provincial_id

      t.timestamps
    end
    add_index :districts, :provincial_id
  end
end
