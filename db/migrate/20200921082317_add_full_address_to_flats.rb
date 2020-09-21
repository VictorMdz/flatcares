class AddFullAddressToFlats < ActiveRecord::Migration[6.0]
  def change
    add_column :flats, :full_address, :string
  end
end
