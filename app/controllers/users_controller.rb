class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @users = [User.includes(:posts).find(params[:id])]
    @posts = @users[0].recent_posts
  end
end
