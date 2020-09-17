class ChangesInTasksAndAreas < ActiveRecord::Migration[6.0]
  def change
    change_column :tasks, :completed, :boolean, :default => false
    add_column :areas, :description, :string
  end
end
