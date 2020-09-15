class AddStatusToBills < ActiveRecord::Migration[6.0]
  def change
    add_column :bills, :status, :integer, default: 1
  end
end
