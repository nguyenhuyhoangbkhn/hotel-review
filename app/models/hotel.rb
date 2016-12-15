# == Schema Information
#
# Table name: hotels
#
#  id            :integer          not null, primary key
#  name          :string
#  countRoom     :integer
#  introduction  :text
#  phone_number  :string
#  website       :string
#  score_average :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  price         :integer
#  hotel_kind    :string
#

class Hotel < ApplicationRecord
  searchkick
  has_many :attachments, as: :attachable, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :destination_addresses, dependent: :destroy
  has_many :rate_hotels, dependent: :destroy
  has_many :reviews, dependent: :destroy

  accepts_nested_attributes_for :destination_addresses, :rate_hotels,
    reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :attachments, :comments, :reviews,
    reject_if: :all_blank, allow_destroy: true

  validates :name, :price, presence: true

  # scope :by_score, joins: :reviews, group: "hotels.id", order: "AVG(reviews.rating) DESC"

  def avg_rate
    if reviews.present?
      calculate_rate = reviews.inject(0) do |sum, review|
        sum + review.try(:rating).to_i
      end
      (calculate_rate/reviews.count)
    else
      return 0
    end
  end

  def search_data
    attributes.merge(
      score: reviews.map(&:rating).sum/reviews.size
    )
  end
end
