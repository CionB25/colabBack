class RemoveRequestIdFromUserRequests < ActiveRecord::Migration[5.1]
  def change
    remove_column :user_requests, :request_id, :integer
  end
end
