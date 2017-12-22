class CreateRepositories < ActiveRecord::Migration[5.1]
  def change
    create_table :repositories do |t|
      t.string :name
      t.string :owner_username
      t.text :description
      t.text :shortDescriptionHTML
      t.text :descriptionHTML
      t.string :blobs_url
      t.string :url


      t.timestamps
    end
  end
end
