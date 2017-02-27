class AddPdfToProjects < ActiveRecord::Migration[5.0]
  def change
    add_column :projects, :pdf, :string
  end
end
