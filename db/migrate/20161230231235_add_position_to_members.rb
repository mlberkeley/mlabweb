class AddPositionToMembers < ActiveRecord::Migration[5.0]
  def change
    add_column :members, :position, :string, default: "Position"
  end
end