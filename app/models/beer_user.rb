# == Schema Information
#
# Table name: beer_users
#
#  id         :bigint(8)        not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  beer_id    :bigint(8)
#  user_id    :bigint(8)
#
# Indexes
#
#  index_beer_users_on_beer_id  (beer_id)
#  index_beer_users_on_user_id  (user_id)
#

class BeerUser < ApplicationRecord
  belongs_to :beer
  belongs_to :user
end
