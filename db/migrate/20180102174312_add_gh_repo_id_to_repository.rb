class AddGhRepoIdToRepository < ActiveRecord::Migration[5.1]
  def change
    add_column :repositories, :gh_repo_id, :integer
  end
end
