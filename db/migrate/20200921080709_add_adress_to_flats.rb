class AddAdressToFlats < ActiveRecord::Migration[6.0]
  def change
    add_column :flats, :address, :text
  end
end
