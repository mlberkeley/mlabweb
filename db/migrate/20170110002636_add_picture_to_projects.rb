class AddPictureToProjects < ActiveRecord::Migration[5.0]
  def change
    add_column :projects, :picture, :string
  end
end
