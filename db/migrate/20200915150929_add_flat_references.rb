class AddFlatReferences < ActiveRecord::Migration[6.0]
  def change
    add_reference :events, :flat
    add_reference :areas, :flat
  end
end
