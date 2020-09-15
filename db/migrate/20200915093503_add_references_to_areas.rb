class AddReferencesToAreas < ActiveRecord::Migration[6.0]
  def change
    add_reference :areas, :assigned_user
    add_reference :areas, :previously_assigned_user
  end
end
