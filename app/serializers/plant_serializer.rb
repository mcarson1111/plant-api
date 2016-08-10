class PlantSerializer < ActiveModel::Serializer
  attributes :id, :name, :soil, :space, :regions, :companions
end
