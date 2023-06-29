require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    before(:each) do
      get '/users/:user_id/posts'
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end
    it 'return 200' do
      expect(response.status).to eq(200)
    end
    it 'renders the index template' do
      expect(response).to render_template('index')
    end
  end

  describe 'GET /show' do
    before(:each) do
      get '/users/:user_id/posts/1'
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end
    it 'return 200' do
      expect(response.status).to eq(200)
    end
    it 'renders the show template' do
      expect(response).to render_template('show')
    end
    it 'include the details of a post' do
      expect(response.body).to include('Post')
    end
    it 'includes the correct placeholder text' do
      expect(response.body).to include('User Post Details')
    end
  end
end
