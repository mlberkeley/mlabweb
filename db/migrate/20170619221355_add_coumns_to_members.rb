class AddCoumnsToMembers < ActiveRecord::Migration[5.0]
  def change
    add_column :members, :provider, :string
    add_column :members, :uid, :string
    add_column :members, :fname, :string
    add_column :members, :lname, :string
    add_column :members, :exec, :boolean, default: false
    add_column :members, :admin, :boolean, default: false
    add_column :members, :officer, :boolean, default: false
    add_column :members, :position, :string, default: "Member"
    add_column :members, :introduction, :text
    add_column :members, :picture, :string
    add_column :members, :background, :string
    add_column :members, :major, :string, default: "Undeclared"
    add_column :members, :grade, :string, default: "Freshman"
  end
end
