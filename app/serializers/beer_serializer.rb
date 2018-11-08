# == Schema Information
#
# Table name: beers
#
#  id              :bigint(8)        not null, primary key
#  brewery_db_json :jsonb
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  brewery_id      :bigint(8)
#
# Indexes
#
#  index_beers_on_brewery_id  (brewery_id)
#

class BeerSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :style, :availability, :update_date
  belongs_to :brewery
end
