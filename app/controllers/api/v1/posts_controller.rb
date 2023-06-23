class Api::V1::PostsController < ApplicationController
  protect_from_forgery with: :null_session

  def index
    user = User.find(params[:user_id])
    posts = user.posts
    render json: posts
  end
end
