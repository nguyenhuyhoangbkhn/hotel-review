class AddSomeColumn < ActiveRecord::Migration[5.0]
  def change
    add_column :hotels, :price, :integer
    add_column :users, :name, :string
  end
end
