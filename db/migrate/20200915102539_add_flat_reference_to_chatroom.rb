class AddFlatReferenceToChatroom < ActiveRecord::Migration[6.0]
  def change
    add_reference :chatrooms, :flat, null: false, foreign_key: true
  end
end
