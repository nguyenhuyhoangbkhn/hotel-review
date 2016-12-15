class AddSomeColumns < ActiveRecord::Migration[5.0]
  def change
    remove_column :hotels, :hotel_kind, :integer
    add_column :hotels, :hotel_kind, :string
  end
end
