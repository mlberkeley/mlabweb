class AddOfficersToMembers < ActiveRecord::Migration[5.0]
  def change
    add_column :members, :officer, :boolean, default: false
  end
end
