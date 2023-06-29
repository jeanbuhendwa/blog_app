require 'rails_helper'
require 'faker'

RSpec.describe 'Users', type: :request do
  describe 'GET /users' do
    it 'should responce with success.' do
      get users_path
      expect(response).to have_http_status(:success)
    end
    it 'should responce with correct status' do
      get users_path
      expect(response.status).to eq(200)
    end
    it 'should include correct placeholder text.' do
      get users_path
      expect(response.body).to include('Users List')
    end
    it 'should render correct template' do
      get users_path
      expect(response).to render_template('index')
    end
  end

  describe 'GET /users/:id' do
    let(:user) { User.create(name: 'John Doe', email: Faker::Internet.unique.email) }

    it 'should respond with success' do
      get user_path(user)
      expect(response).to have_http_status(:success)
    end

    it 'should render correct template' do
      get user_path(user)
      expect(response).to render_template('show')
    end

    it 'should include the correct placeholder text' do
      get user_path(user)
      expect(response.body).to include('User details')
    end
  end
end
