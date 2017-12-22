class CreateUserRepos < ActiveRecord::Migration[5.1]
  def change
    create_table :user_repos do |t|
      t.integer :user_id
      t.string :repository_integer

      t.timestamps
    end
  end
end
