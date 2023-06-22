class UsersController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  before_action :authenticate_user!

  def index
    @users = User.all.order(:updated_at)
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
  end

  Roles = [ :admin , :default ]

  def is?( requested_role )
    self.role == requested_role.to_s
  end

  private

  def record_not_found
    flash[:error] = 'User not found'
    redirect_to root_url
  end
end
