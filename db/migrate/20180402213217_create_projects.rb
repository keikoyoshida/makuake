class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string     :title, null: false
      t.string     :heading_movie, null: false
      t.text       :content_html, null: false
      t.string     :content_image
      t.time       :deadline, null: false
      t.references :user, foreign_key: true
      t.references :project_type, foreign_key: true
      t.timestamps
    end
    add_index :projects, :title
    add_index :projects, :deadline
  end
end
