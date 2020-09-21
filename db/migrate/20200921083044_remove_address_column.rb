class RemoveAddressColumn < ActiveRecord::Migration[6.0]
  def change
    remove_column :flats, :address
  end
end
