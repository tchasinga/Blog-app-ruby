require 'rails_helper'

RSpec.describe 'Users', type: :request do
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

    it 'checks if the response body includes the "All users" placeholder text' do
      expect(response.body).to include('All users')
    end
  end
  describe 'GET /show' do
    before :each do
      get '/users/:id'
    end

    it 'checks the response status' do
      expect(response).to have_http_status(:success)
    end

    it 'checks if the show template is rendered' do
      expect(response).to render_template(:show)
    end

    it 'checks if the response body includes the "User profile" placeholder text' do
      expect(response.body).to include('User profile')
    end
  end
end
