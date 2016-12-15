# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  name                   :string
#  address                :string
#  tel                    :string
#  bio                    :string
#  job                    :string
#  edu                    :string
#  birthday               :datetime
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :comments, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_one :avatar, as: :attachable, dependent: :destroy
  # validates :avatar, presence: true
  accepts_nested_attributes_for :avatar


  before_validation :not_assign_password_with_blank, on: :update

  def not_assign_password_with_blank
    self.password = password.presence
    self.password_confirmation = password_confirmation.presence
  end
end
