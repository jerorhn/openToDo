class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :completed, :private, :list_id
end
