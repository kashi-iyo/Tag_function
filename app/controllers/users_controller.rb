class UsersController < ApplicationController

  include UsersHelper

  before_action :authenticate_user!
  # before_action :correct_user
  before_action :admin_user, only: :destroy
  before_action :set_user

  def index
    @users = User.all
  end

  def show
    @posts = @user.posts  #ユーザーの作品
    @favorite_posts = @user.favorite_posts  #ユーザーがお気に入りした作品
    @tweets = @user.tweets.order(created_at: :desc).page(params[:page]) #ユーザーのツイート
    @relationship = current_user.relationships.find_by(follow_id: @user.id)  #DBから相手ユーザーとのRelationshipを取得する
    @set_relationship = current_user.relationships.new  #ビューから参照するための、空のRelationshipモデルを作成する。
  end

  def edit
  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to users_url
  end

  def update
    if @user.update_attributes(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  def followings
    @users = @user.followings.page(params[:page])
  end

  def followers
    @users = @user.followers.page(params[:page])
  end

  private
  def user_params
    params.require(:user).permit(:username)
  end

  def set_user
    @user = User.find(params[:id])
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
