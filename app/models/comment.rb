class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post
  # Method to update the comments counter for a post
  after_create :increment_post_comments_counter
  after_destroy :decrement_post_comments_counter

  def increment_post_comments_counter
    post.increment!(:comments_count)
  end

  def decrement_post_comments_counter
    post.decrement!(:comments_count)
  end
end
