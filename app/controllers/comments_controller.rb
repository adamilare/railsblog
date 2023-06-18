class CommentsController < ApplicationController
  def create
    @comment = Comment.new(params.require(:comment).permit(:text))
    @comment.author = current_user
    @comment.post_id = params[:post_id]

    if @comment.save
      flash[:success] = 'Comment added successfully!'
      redirect_to request.referrer
    else
      flash.now[:error] = 'comment creation failed!'
    end
  end
end
