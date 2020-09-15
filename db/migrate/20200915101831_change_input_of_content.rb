class ChangeInputOfContent < ActiveRecord::Migration[6.0]
  def change
    change_column :messages, :content, :text
  end
end
