class AddParticipatingToParticipations < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :participating, :boolean, default: false
  end
end
