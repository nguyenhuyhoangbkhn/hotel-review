class AddPictureToAttachment < ActiveRecord::Migration[5.0]
  def change
    add_column :attachments, :picture, :string
    add_column :attachments, :attachable_id, :integer
    add_column :attachments, :attachable_type, :string
    remove_column :attachments, :hotel_id
  end
end
