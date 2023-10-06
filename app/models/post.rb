class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :comments
  has_many :likes

  validates :title, presence: true, length: { maximum: 250 }
  validates :commentsCounter, numericality: { greater_than_or_equal_to: 0, only_integer: true }
  validates :likesCounter, numericality: { greater_than_or_equal_to: 0, only_integer: true }

  after_create :update_user_posts_counter
  after_initialize :set_default

  def set_default
    self.likesCounter ||= 0
    self.commentsCounter ||= 0
  end

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  private

  def update_user_posts_counter
    author.update_posts_counter
  end
end
