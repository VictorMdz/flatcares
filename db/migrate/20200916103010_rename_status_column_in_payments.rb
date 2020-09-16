class RenameStatusColumnInPayments < ActiveRecord::Migration[6.0]
  def change
    rename_column :payments, :status, :paid
  end
end
