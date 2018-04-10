class RenameContentImageToPojects < ActiveRecord::Migration[5.0]
  def change
    rename_column :projects, :content_image, :content_images
  end
end
