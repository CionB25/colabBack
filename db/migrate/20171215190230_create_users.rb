class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :avatarUrl
      t.text :bio
      t.string :url

      t.timestamps
    end
  end
end
