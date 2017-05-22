# == Schema Information
#
# Table name: lunches
#
#  id            :integer          not null, primary key
#  name          :string           not null
#  restaurant_id :integer          not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Lunch < ApplicationRecord
  belongs_to :restaurant

  has_many :reviews

  has_many :users,
    through: :reviews,
    source: :user
end
