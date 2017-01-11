class AddDeetsToMembers < ActiveRecord::Migration[5.0]
  def change
    add_column :members, :major, :string, default: "Agriculture"
    add_column :members, :grade, :string, default: "Freshman"
  end
end
