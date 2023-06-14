class UsersController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
  end

  private

  def record_not_found
    flash[:error] = 'User not found'
    redirect_to root_url
  end
end
