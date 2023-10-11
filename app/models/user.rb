class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable
  # validates :name, presence: true, length: { in: 1..250 }
  # validates :photo, presence: true, length: { in: 1..250 }
  # validates :bio, presence: true, length: { in: 1..250 }
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  has_many :posts, foreign_key: :author_id
  has_many :likes, foreign_key: :author_id
  has_many :comments, foreign_key: :author_id

  def recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end
