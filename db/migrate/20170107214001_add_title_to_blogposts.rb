class AddTitleToBlogposts < ActiveRecord::Migration[5.0]
  def change
    add_column :blogposts, :title, :string, default: "Title"
  end
end
