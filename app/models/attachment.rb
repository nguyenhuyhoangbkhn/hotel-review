# == Schema Information
#
# Table name: attachments
#
#  id                 :integer          not null, primary key
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#  picture            :string
#  attachable_id      :integer
#  attachable_type    :string
#

class Attachment < ApplicationRecord
  mount_uploader :picture, AttachmentUploader
  belongs_to :attachable, polymorphic: true, optional: true
end
