class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.string :category, null: false, default: ""
      t.timestamps
    end
    add_index :categories, :category, unique: true
  end
end
