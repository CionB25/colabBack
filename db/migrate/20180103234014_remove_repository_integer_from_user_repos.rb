class RemoveRepositoryIntegerFromUserRepos < ActiveRecord::Migration[5.1]
  def change
    remove_column :user_repos, :repository_integer, :string
  end
end
