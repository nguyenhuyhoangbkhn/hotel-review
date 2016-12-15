# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  content    :text
#  user_id    :integer
#  hotel_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  picture    :string
#

class Comment < ApplicationRecord
  mount_uploader :picture, AttachmentUploader
  belongs_to :hotel, optional: true
  belongs_to :user, optional: true
  validates :content, presence: true
end
