class AddLikesCounterToPosts < ActiveRecord::Migration[7.0]
  def change
    remove_column :posts, :likesCounter if column_exists?(:posts, :likesCounter)
    add_column :posts, :likesCounter, :integer
  end
end