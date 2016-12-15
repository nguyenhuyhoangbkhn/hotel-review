# == Schema Information
#
# Table name: provincials
#
#  id            :integer          not null, primary key
#  name          :string
#  ordinate      :string
#  province_kind :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Provincial < ApplicationRecord
  has_many :districts, inverse_of: :provincial

  accepts_nested_attributes_for :districts,
    reject_if: :all_blank, allow_destroy: true
end
