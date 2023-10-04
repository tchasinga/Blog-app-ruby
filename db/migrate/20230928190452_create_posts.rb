class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.references :author, foreign_key: { to_table: :users }, null: false
      t.string :title
      t.text :text
      t.integer :comments_counter, default: 0
      t.integer :likes_counter, default: 0
      t.timestamps
    end

    add_index :posts, [:author_id, :created_at]
  end
end
