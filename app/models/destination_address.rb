# == Schema Information
#
# Table name: destination_addresses
#
#  id         :integer          not null, primary key
#  name       :string
#  village_id :integer
#  address    :string
#  hotel_id   :integer
#  user_id    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class DestinationAddress < ApplicationRecord
  belongs_to :village
  belongs_to :hotel
end
