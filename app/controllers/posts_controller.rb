class PostsController < ApplicationController
  load_and_authorize_resource
  def index
    @users = [User.includes(:posts).find(params[:user_id])]
    @posts = @users[0].posts.includes(:comments)
  end

  def show
    @posts = [Post.find(params[:id])]
    @user = @posts[0].author
    @comment = Comment.new
    @like = Like.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to user_posts_path(current_user)
    else
      render 'new'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    authorize! :destroy, @post
    if @post.destroy
      flash.now[:success] = 'Post was successfully destroyed!'
    else
      flash[:error] = 'Post couldnt be destroyed!'
    end
    redirect_to user_posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
