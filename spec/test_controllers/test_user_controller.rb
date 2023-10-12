require 'rails_helper'

RSpec.describe 'User', type: :request do
  describe 'GET users#index' do
    before(:each) do
      @user1 = User.create(name: 'user1')
      @user2 = User.create(name: 'user2')
      get users_path
    end

    it 'is success ' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders the correct template' do
      expect(response).to render_template(:index)
    end

    it 'does not render a different template' do
      expect(response).to_not render_template(:show)
    end

    it 'Contains the placeholder text' do
      expect(response.body).to match('All users')
    end
  end

  describe 'Get users#show' do
    before(:each) do
      @user2 = User.create(name: 'today')
      @user2 = User.create(name: 'today2')
      get "/users/#{@user1.id}"
    end

    it 'renders the correct template' do
      expect(response).to render_template(:show)
    end

    it 'not renders the other templates' do
      expect(response).not_to render_template(:index)
    end

    it 'renders "show template" with corrent text' do
      expect(response.body).to match('Recent Posts')
    end
  end
end