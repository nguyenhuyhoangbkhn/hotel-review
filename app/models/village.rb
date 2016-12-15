# == Schema Information
#
# Table name: villages
#
#  id           :integer          not null, primary key
#  name         :string
#  ordinate     :string
#  village_kind :integer
#  district_id  :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_villages_on_district_id  (district_id)
#

class Village < ApplicationRecord
  belongs_to :district, optional: true
end
