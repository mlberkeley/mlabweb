class AddPictureToBlogposts < ActiveRecord::Migration[5.0]
  def change
    add_column :blogposts, :picture, :string
  end
end
