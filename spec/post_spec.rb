require 'rails_helper'

RSpec.describe Post, type: :model do
  subject(:post) { described_class.new(title: 'Sample Title', comments_counter: 3, likes_counter: 2) }
  it 'title must not be blank.' do
    post = Post.new(title: nil)
    expect(post).not_to be_valid
  end
  it 'is not valid without a title' do
    post.title = nil
    expect(post).not_to be_valid
  end

  it 'is not valid with a title exceeding 250 characters' do
    post.title = 'A' * 251
    expect(post).not_to be_valid
  end

  it 'is not valid with a negative comments_counter' do
    post.comments_counter = -1
    expect(post).not_to be_valid
  end

  it 'is not valid with a negative likes_counter' do
    post.likes_counter = -1
    expect(post).not_to be_valid
  end
end
