class AddDbIndices < ActiveRecord::Migration[5.0]
  def change
    add_index :members, :email, unique: true
  end
end
