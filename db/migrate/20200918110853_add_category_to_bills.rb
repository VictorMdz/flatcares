class AddCategoryToBills < ActiveRecord::Migration[6.0]
  def change
    add_column :bills, :category, :string
  end
end
