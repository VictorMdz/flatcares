class RemoveStatusColumn < ActiveRecord::Migration[6.0]
  def change
    remove_column :bills, :status
  end
end
