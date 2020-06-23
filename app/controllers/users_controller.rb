class UsersController < ApplicationController

  include UsersHelper

  before_action :authenticate_user!
  before_action :correct_user, except: [:index]
  before_action :admin_user, only: :destroy

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
    @favorite_posts = @user.favorite_posts
    @tweets = @user.tweets.page(params[:page])
  end

  def edit
    @user = User.find(params[:id])
  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to users_url
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  private
  def user_params
    params.require(:user).permit(:username)
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to root_url unless current_user?(@user)
    flash[:danger] = "無効なアドレスです"
  end

  def admin_user
    redirect_to root_url unless current_user.admin?
  end
end
