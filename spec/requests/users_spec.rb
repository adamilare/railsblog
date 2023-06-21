require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET #index' do
    before { get users_url }

    it 'successfull request' do
      expect(response.status).to eq(200)
    end

    it 'should render the index template' do
      expect(response).to render_template(:index)
    end

    it 'should render the index placeholder' do
      expect(response.body).not_to include('List all users')
    end
  end

  describe 'GET #show' do
    before do
      user = User.first
      get user_path(user)
    end
    it 'successful request' do
      expect(response.status).to eq(200)
    end

    it 'should render the show template' do
      expect(response).to render_template(:show)
    end

    it 'should render the show placehoder' do
      expect(response.body).not_to include('Display a selected user')
    end
  end
end
