class AddStatusColumnToPayment < ActiveRecord::Migration[6.0]
  def change
    add_column :payments, :status, :boolean, default: false
  end
end
