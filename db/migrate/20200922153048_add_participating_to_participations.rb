class AddParticipatingToParticipations < ActiveRecord::Migration[6.0]
  def change
    add_column :participations, :participating, :boolean
  end
end
