class ChangeColumnToNotNull < ActiveRecord::Migration[6.1]
  def change
    change_column :restaurants, :range, :integer, null: false
  end
end
