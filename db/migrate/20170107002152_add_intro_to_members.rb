class AddIntroToMembers < ActiveRecord::Migration[5.0]
  def change
    add_column :members, :introduction, :text, default: "I love Machine Learning At Berkeley"
  end
end
