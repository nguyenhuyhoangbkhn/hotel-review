class AddRole < ActiveRecord::Migration[5.0]
  def change
    add_column :admin_users, :role, :integer
  end
end
