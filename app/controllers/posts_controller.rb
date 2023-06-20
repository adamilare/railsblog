class PostsController < ApplicationController
  def index
    @user = selected_user
    @posts = @user.posts
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
  end

  def new
    @user = current_user
    @post = Post.new
  end

  def create
    @user = current_user
    @post = @user.posts.new(post_params)

    respond_to do |format|
      format.html do
        if @post.save
          flash[:success] = 'Post created successfully!'
          redirect_to user_posts_url(@user), notice: "Post created successfully"
        else
          flash.now[:error] = 'Error: Post not created!'
          render :new
        end
      end
    end
  end

  private

  def selected_user
    User.find(params[:user_id])
  end

  def post_params
    params.require(:new_post).permit(:title, :text)
  end
end
