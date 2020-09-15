class ChangeFlatmatesToFlatmembers < ActiveRecord::Migration[6.0]
  def change
    rename_table :flatmates, :flatmembers
  end
end
