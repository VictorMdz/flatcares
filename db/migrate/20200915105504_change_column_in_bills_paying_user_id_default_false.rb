class ChangeColumnInBillsPayingUserIdDefaultFalse < ActiveRecord::Migration[6.0]
  def change
    change_column :bills, :status, :boolean, :default => false
  end
end
