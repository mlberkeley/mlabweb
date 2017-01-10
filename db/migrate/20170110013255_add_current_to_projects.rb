class AddCurrentToProjects < ActiveRecord::Migration[5.0]
  def change
    add_column :projects, :current, :boolean, default: true
  end
end
