require 'rails_helper'
RSpec.describe 'posts#show', type: :feature do
  before(:each) do
    @user = User.create(
      name: 'John',
      photo: 'john.jpg',
      bio: 'Web Developer',
      posts_counter: 0
    )
    @posts = [
      @post1 = Post.create(author: @user, title: 'User Post 1', text: 'This is User Post 1'),
      @post2 = Post.create(author: @user, title: 'User Post 2', text: 'This is User Post 2'),
      @post3 = Post.create(author: @user, title: 'User Post 3', text: 'This is User Post 3')
    ]
    visit user_posts_url(user_id: @user.id)
  end
  describe '#show page' do
    before(:each) do
      visit user_post_path(@user, @post3)
    end
    it 'can see posts title' do
      expect(page).to have_content(@post3.title.to_s)
    end
    it 'can see who wrote the post.' do
      expect(page).to have_content(@user.name.to_s)
    end
    it 'can see how many comments it has' do
      expect(page).to have_content(@post3.commentsCounter.to_s)
    end
    it 'can see how many likes a post has' do
      expect(page).to have_content(@post3.likesCounter.to_s)
    end
    it 'can see the post body' do
      expect(page).to have_content(@post3.text.to_s)
    end
    it 'can see the username of each commentor' do
      @post1.recent_comments.each do |comment|
        expect(page).to have_content(comment.user.name)
      end
    end
    it 'can see the comment each commentor left.' do
      @post1.recent_comments.each do |comment|
        expect(page).to have_content(comment.user.text)
      end
    end
  end
end
