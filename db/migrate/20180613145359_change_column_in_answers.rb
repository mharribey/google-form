class ChangeColumnInAnswers < ActiveRecord::Migration[5.0]
  def change
    rename_column :answers, :valid, :validation
  end
end
