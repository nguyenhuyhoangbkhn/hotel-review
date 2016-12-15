# == Schema Information
#
# Table name: rate_hotels
#
#  id            :integer          not null, primary key
#  hotel_id      :integer
#  user_id       :integer
#  admin_user_id :integer
#  rating        :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class RateHotel < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :admin_user, optional: true
  belongs_to :hotel, optional: true
  validates_uniqueness_of :user_id, scope: :hotel_id
end
