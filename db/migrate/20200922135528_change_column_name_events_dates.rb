class ChangeColumnNameEventsDates < ActiveRecord::Migration[6.0]
  def change
    rename_column :events, :start_date, :start_time
    rename_column :events, :end_date, :end_time
  end
end
