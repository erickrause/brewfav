# == Schema Information
#
# Table name: breweries
#
#  id              :bigint(8)        not null, primary key
#  brewery_db_json :jsonb
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class BrewerySerializer < ActiveModel::Serializer
  attributes :id, :name
end
