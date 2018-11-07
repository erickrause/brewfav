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

class Beer < ApplicationRecord
  include JsonObject
  belongs_to :brewery

  scope :where_brewery_db_id, -> (id) {
    where("brewery_db_json ->> 'id' = ?", id)
  }

  def style
    self.brewery_style.name
  end

  def availability
    self.brewery_availability.name
  end

  def description
    self.brewery_style.description
  end

end
