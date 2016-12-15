class AddPictureToComment < ActiveRecord::Migration[5.0]
  def change
    add_column :comments, :picture, :string
  end
end
