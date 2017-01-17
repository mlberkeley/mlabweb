class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :name
      t.boolean :live, default: false
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
