class AddRepoIdToRepository < ActiveRecord::Migration[5.1]
  def change
    add_column :repositories, :repo_id, :integer
  end
end
