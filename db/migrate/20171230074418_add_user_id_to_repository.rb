class AddUserIdToRepository < ActiveRecord::Migration[5.1]
  def change
    add_column :repositories, :user_id, :integer
  end
end
