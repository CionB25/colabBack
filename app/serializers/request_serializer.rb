class RequestSerializer < ActiveModel::Serializer
  attributes :id, :ownername, :repository_id
end
