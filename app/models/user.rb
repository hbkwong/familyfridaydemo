# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  email      :string           not null
#  name       :string
#  team       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ApplicationRecord
  has_many :reviews

  has_many :lunches,
    through: :reviews,
    source: :lunch

  validates :email, presence: true
  validates :email, uniqueness: true
end
