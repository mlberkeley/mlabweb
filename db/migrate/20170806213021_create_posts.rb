class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.text :content
      t.string :video
      t.string :photo
      t.integer :project
      t.references :member, foreign_key: true

      t.timestamps
    end
    add_index :posts, [:member_id, :created_at]
  end
end
