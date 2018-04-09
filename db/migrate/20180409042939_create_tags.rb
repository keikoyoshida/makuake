class CreateTags < ActiveRecord::Migration[5.0]
  def change
    create_table :tags do |t|
      t.string :tag, null: false, default: ""
      t.timestamps
    end
    add_index :tags, :tag, unique: true
  end
end
