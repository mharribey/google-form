class AddTimerToForms < ActiveRecord::Migration[5.0]
  def change
    add_column :forms, :timer, :integer
  end
end
