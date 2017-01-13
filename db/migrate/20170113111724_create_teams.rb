class CreateTeams < ActiveRecord::Migration[5.0]
  def change
    create_table :teams do |t|
      t.belongs_to :member, index: true
      t.belongs_to :project, index: true
      t.integer :year
      t.string :semester
      t.string :picture

      t.timestamps
    end
  end
end
