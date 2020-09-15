class FlatAndBillChanges < ActiveRecord::Migration[6.0]
  def change
    add_column :flatmembers, :is_landlord, :boolean, default: false, nil: false
    add_reference :bills, :flat
  end
end
