class AddOverDueToBills < ActiveRecord::Migration[6.0]
  def change
    add_column :bills, :due_date, :date
  end
end
