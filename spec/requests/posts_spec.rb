require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  let(:user) { create(:user) }

  describe 'GET /index' do
    before :each do
      get "/users/#{user.id}/posts"
    end

    it 'checks the response status' do
      expect(response).to have_http_status(:success)
    end

    it 'checks if the index template is rendered' do
      expect(response).to render_template(:index)
    end

    it 'checks if the response body includes the "Number of posts:" text' do
      expect(response.body).to include('Number of posts:')
    end
  end

  describe 'GET /show' do
    let(:post) { create(:post, author: user) }
    before :each do
      get "/users/#{user.id}/posts/#{post.id}"
    end

    it 'checks the response status' do
      expect(response).to have_http_status(:success)
    end

    it 'checks if the show template is rendered' do
      expect(response).to render_template(:show)
    end

    it 'checks if the response body includes the "Comments:" text' do
      expect(response.body).to include('Comments:')
    end
  end
end
