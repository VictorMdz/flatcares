class CreateFlatmates < ActiveRecord::Migration[6.0]
  def change
    create_table :flatmates do |t|
      t.boolean :is_admin
      t.references :user, null: false, foreign_key: true
      t.references :flat, null: false, foreign_key: true

      t.timestamps
    end
  end
end
