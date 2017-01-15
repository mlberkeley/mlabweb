class AddViewsToBlogposts < ActiveRecord::Migration[5.0]
  def change
    add_column :blogposts, :views, :bigint, default: 0
  end
end
