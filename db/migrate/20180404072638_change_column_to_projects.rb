class ChangeColumnToProjects < ActiveRecord::Migration[5.0]
  def change
    change_column :projects, :deadline, :date, null: false
  end
end
