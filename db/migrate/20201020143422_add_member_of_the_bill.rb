class AddMemberOfTheBill < ActiveRecord::Migration[6.0]
  def change
    add_column :bills, :sharing_member, :integer, array: true, default: []
  end
end
