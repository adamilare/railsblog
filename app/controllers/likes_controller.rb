class LikesController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    like = Like.new
    like.author = current_user
    like.post = post
    if like.save
      flash.now[:success] = 'Like created successfully'
    else
      flash.now[:error] = 'Like not created'
    end
    redirect_to request.referrer
  end
end
