class Repository < ApplicationRecord
  belongs_to :user
  has_many :requests

  # attr_reader :requests


  # def requests
  #   # @requests.select do |request|
  #   #   request.repository_id == self.id
  #   requests = Request.all.map {|item| item.repository}
  #   my_requests = requests.select {|repo| repo.user_id == self.id }
  #   # end
  #   my_requests
  #
  # end


end
