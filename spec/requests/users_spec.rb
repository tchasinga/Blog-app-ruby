require 'rails_helper'

RSpec.describe 'Users', type: :request do
  let(:user) { create(:user) }

  describe 'GET /index' do
    before :each do
      get '/users'
    end

    it 'checks the response status' do
      expect(response).to have_http_status(:success)
    end

    it 'checks if the index template is rendered' do
      expect(response).to render_template(:index)
    end

    it 'checks if the response body includes' do
      expect(response.body).to include
    end
  end

  describe 'GET /show' do
    before :each do
      get "/users/#{user.id}"
    end

    it 'checks the response status' do
      expect(response).to have_http_status(:success)
    end

    it 'checks if the show template is rendered' do
      expect(response).to render_template(:show)
    end

    it 'checks if the response body includes the "Bio" text' do
      expect(response.body).to include('Bio')
    end
  end
end
