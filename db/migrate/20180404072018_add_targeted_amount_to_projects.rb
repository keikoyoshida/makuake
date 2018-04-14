class AddTargetedAmountToProjects < ActiveRecord::Migration[5.0]
  def change
    add_column :projects, :targeted_amount, :integer, null: false
  end
end
