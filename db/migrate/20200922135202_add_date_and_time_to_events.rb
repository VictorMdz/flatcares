class AddDateAndTimeToEvents < ActiveRecord::Migration[6.0]
  def change
    change_column :events, :start_date, :time
    change_column :events, :end_date, :time
    add_column :events, :date, :date
  end
end
