class BeerSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :style, :update_date
end