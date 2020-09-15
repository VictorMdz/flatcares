class AddPayingUserIdToBills < ActiveRecord::Migration[6.0]
  def change
    add_reference :bills, :paying_user
  end
end
