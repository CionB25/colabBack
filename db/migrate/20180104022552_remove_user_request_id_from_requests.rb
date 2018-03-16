class RemoveUserRequestIdFromRequests < ActiveRecord::Migration[5.1]
  def change
    remove_column :requests, :user_request_id, :integer
  end
end
