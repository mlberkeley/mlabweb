class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :sname
      t.string :tag
      t.text :description
      t.string :picture
      t.string :background
      t.integer :year
      t.string :semester

      t.timestamps
    end
  end
end
