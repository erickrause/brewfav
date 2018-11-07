class BeerSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :style, :availability, :update_date
end