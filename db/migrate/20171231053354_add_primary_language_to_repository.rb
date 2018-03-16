class AddPrimaryLanguageToRepository < ActiveRecord::Migration[5.1]
  def change
    add_column :repositories, :primaryLanguage, :string
  end
end
