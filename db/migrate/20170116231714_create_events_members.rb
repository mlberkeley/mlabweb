class CreateEventsMembers < ActiveRecord::Migration[5.0]
  def change
    create_table :events_members do |t|
      t.references :event, foreign_key: true
      t.references :member, foreign_key: true
    end
  end
end
