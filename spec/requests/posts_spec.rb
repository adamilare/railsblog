require 'rails_helper'

describe 'Posts', type: :request do
  before do
    @user = User.second
    @post = @user.posts.first
  end

  describe 'GET #index' do
    before { get user_posts_path(@user) }

    it 'successfull request' do
      expect(response.status).to eq(200)
    end

    it 'should render the index template' do
      expect(response).to render_template(:index)
    end

    it 'should render the index placeholder' do
      expect(response.body).not_to include('List all posts for a user')
    end
  end

  describe 'GET #show' do
    before { get user_post_path(@user, @post) }

    it 'successful request' do
      expect(response.status).to eq(200)
    end

    it 'should render the show template' do
      expect(response).to render_template(:show)
    end

    it 'should render the show placehoder' do
      expect(response.body).not_to include('Display a selected post')
    end
  end
end
