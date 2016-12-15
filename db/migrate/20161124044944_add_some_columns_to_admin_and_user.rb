class AddSomeColumnsToAdminAndUser < ActiveRecord::Migration[5.0]
  def change
    add_column :admin_users, :address, :string
    add_column :admin_users, :tel, :string
    add_column :admin_users, :bio, :string
    add_column :admin_users, :job, :string
    add_column :admin_users, :edu, :string
    add_column :admin_users, :name, :string
    add_column :admin_users, :birthday, :datetime

    add_column :users, :address, :string
    add_column :users, :tel, :string
    add_column :users, :bio, :string
    add_column :users, :job, :string
    add_column :users, :edu, :string
    add_column :users, :birthday, :datetime
  end
end
