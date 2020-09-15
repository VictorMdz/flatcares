class ModifyingColumnEvenTitile < ActiveRecord::Migration[6.0]
  def change
    rename_column :events, :title, :name
    add_column :events, :event_type, :integer
    remove_column :events, :type
  end
end
