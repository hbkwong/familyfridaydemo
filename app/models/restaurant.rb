# == Schema Information
#
# Table name: restaurants
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  logo       :string
#  yelp_link  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Restaurant < ApplicationRecord
  has_many :lunches

  has_many :reviews,
    through: :lunches,
    source: :reviews
end
