class AddPostsCountToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :postsCounter, :integer
  end
end
