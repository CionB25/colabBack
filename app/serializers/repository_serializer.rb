class RepositorySerializer < ActiveModel::Serializer
  attributes :id,:name,:owner_username,:description,:url,:primaryLanguage,:requests
end
