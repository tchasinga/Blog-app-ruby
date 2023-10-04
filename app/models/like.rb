class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post
  # Method to update the likes counter for a post
  after_create :increment_post_likes_counter
  after_destroy :decrement_post_likes_counter

  def increment_post_likes_counter
    post.increment!(:likes_counter)
  end

  def decrement_post_likes_counter
    post.decrement!(:likes_counter)
  end
end
