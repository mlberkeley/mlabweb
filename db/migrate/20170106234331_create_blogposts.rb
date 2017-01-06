class CreateBlogposts < ActiveRecord::Migration[5.0]
  def change
    create_table :blogposts do |t|
      t.text :content
      t.boolean :published
      t.references :member, foreign_key: true

      t.timestamps
    end
    add_index :blogposts, [:member_id, :created_at]
  end
end
