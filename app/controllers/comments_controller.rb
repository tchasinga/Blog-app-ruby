class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(params.require(:comment).permit(:text))
    @comment.user = current_user
    @comment.post = Post.find(params[:post_id])

    if @comment.save
      redirect_to user_post_path(@comment.post.author, @comment.post)
    else
      render :new
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    authorize! :destroy, @comment
    if @comment.destroy
      flash.now[:success] = 'Comment was successfully deleted!'
    else
      flash[:error] = 'Comment couldnt be deleted!'
    end
    redirect_to user_post_path(@comment.post.author, @comment.post)
  end
end
