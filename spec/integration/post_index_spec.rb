require 'rails_helper'

RSpec.describe 'posts#index', type: :feature do
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
  describe '#index page' do
    it 'can see the user profile picture.' do
      expect(page).to have_css("img[src='#{@user.photo}']")
    end
    it 'can see the user username.' do
      expect(page).to have_content(@user.name.to_s)
    end
    it 'can see the number of posts the user has written.' do
      expect(page).to have_content(@user.posts_counter.to_s)
    end
    it 'can see posts title' do
      @posts.each do |post|
        expect(page).to have_content(post.title.to_s)
      end
    end
    it 'can see some of the bodys post' do
      @posts.each do |post|
        expect(page).to have_content(post.text.to_s)
      end
    end
    it 'can see the first comments on a post.' do
      @posts.each do |post|
        post.recent_comments.each do |comment|
          expect(page).to have_content(comment.user.text)
        end
      end
    end
    it 'can see how many comments a post has' do
      @posts.each do |post|
        expect(page).to have_content(post.commentsCounter.to_s)
      end
    end
    it 'can see how many likes a post has' do
      @posts.each do |post|
        expect(page).to have_content(post.likesCounter.to_s)
      end
    end
  end
  describe 'GET show/page' do
    it 'redirects me to that posts show page, when I clicked on a post.' do
      post = @posts.first
      click_link(post.title)
      expect(page).to have_current_path(user_post_path(post.author, post))
    end
  end
end
