require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) { User.create(name: 'John Doe') }
  let(:post) { Post.create(title: 'My Post', text: 'Post body', author_id: user.id) }

  it 'comment text should not be blank' do
    comment = Comment.new(text: nil)
    expect(comment).not_to be_valid
  end

  it 'should return the comment text' do
    comment = Comment.new(text: 'test')
    expect(comment.text).to eq('test')
  end
end
