class AddOwnernameToRequests < ActiveRecord::Migration[5.1]
  def change
    add_column :requests, :ownername, :string
  end
end
