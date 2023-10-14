require 'rails_helper'
RSpec.describe 'users#index', type: :feature do
  before do
    @users = [
      User.create(name: 'Mary', photo: 'mary.jpg', bio: 'Software Developer', posts_counter: 0),
      User.create(name: 'David', photo: 'david.jpg', bio: 'Software Developer', posts_counter: 0),
      User.create(name: 'Justin', photo: 'justin.jpg', bio: 'Software Developer', posts_counter: 0)
    ]
    visit users_path
  end
  describe '#index page' do
    it 'can see the username of all other users.' do
      expect(page).to have_content(@users[0].name)
    end
    it 'can see the profile picture for each user.' do
      @users.each do |user|
        expect(page).to have_css("img[src='#{user.photo}']")
      end
    end
    it 'can see the number of posts each user has written.' do
      @users.each do |user|
        expect(page).to have_content(user.posts_counter.to_s)
      end
    end
    it 'redirects to user show page when clicked on user.' do
      click_link(@users[0].name)
      expect(page).to have_current_path(user_path(@users[0].id))
    end
  end
end
