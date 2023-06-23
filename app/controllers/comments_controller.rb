class CommentsController < ApplicationController
  def create
    @comment = Comment.new(params.require(:comment).permit(:text))
    @comment.author = current_user
    @comment.post_id = params[:post_id]

    if @comment.save
      redirect_to request.referrer, notice: 'Comment added successfully'
    else
      flash.now[:error] = 'comment creation failed!'
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_to request.referrer, notice: 'Comment deleted successfully'
  end
end
