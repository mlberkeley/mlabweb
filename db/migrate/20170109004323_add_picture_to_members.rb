class AddPictureToMembers < ActiveRecord::Migration[5.0]
  def change
    add_column :members, :picture, :string
  end
end
