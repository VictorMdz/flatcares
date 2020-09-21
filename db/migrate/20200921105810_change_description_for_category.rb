class ChangeDescriptionForCategory < ActiveRecord::Migration[6.0]
  def change
    remove_column :areas, :description, :string
    add_column :areas, :category, :integer
  end
end
