class CreateVillages < ActiveRecord::Migration[5.0]
  def change
    create_table :villages do |t|
      t.string :name
      t.string :ordinate
      t.integer :village_kind
      t.integer :district_id

      t.timestamps
    end
    add_index :villages, :district_id
  end
end
