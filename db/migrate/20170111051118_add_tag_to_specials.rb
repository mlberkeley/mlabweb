class AddTagToSpecials < ActiveRecord::Migration[5.0]
  def change
    add_column :specials, :tag, :string
  end
end
