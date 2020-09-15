class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :title
      t.datetime :start_date
      t.datetime :end_date
      t.string :type
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
