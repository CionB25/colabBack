class AddUserRequestIdToRequest < ActiveRecord::Migration[5.1]
  def change
    add_column :requests, :user_request_id, :integer
  end
end
