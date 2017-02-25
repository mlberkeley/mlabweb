class AddAttendanceAttributesToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :description, :text
    add_column :events, :place, :string
    add_column :events, :when, :datetime
  end
end
