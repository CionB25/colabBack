class UserSerializer < ActiveModel::Serializer
  attributes :id,:username,:avatarUrl,:bio,:url
end
