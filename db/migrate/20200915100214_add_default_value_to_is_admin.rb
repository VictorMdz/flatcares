class AddDefaultValueToIsAdmin < ActiveRecord::Migration[6.0]
  def change
    change_column :flatmates, :is_admin, :boolean, :default => false
  end
end
