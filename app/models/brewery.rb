# == Schema Information
#
# Table name: breweries
#
#  id              :bigint(8)        not null, primary key
#  brewery_db_json :jsonb
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Brewery < ApplicationRecord
  has_many :beers
  scope :where_brewery_db_id, -> (id) {
    where("brewery_db_json ->> 'id' = ?", id)
  }
end
