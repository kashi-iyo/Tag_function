class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to @post
    end
  end

  def index
    @posts = Post.all
  end

  def search
    @selection = params[:keyword]
    if @selection == 'new'
      @posts = Post.sort_desc
    elsif @selection == 'old'
      @posts = Post.sort_asc
    elsif @selection == 'likes'
      @posts = Post.sort_favorites_desc
    elsif @selection == 'dislikes'
      @posts = Post.sort_favorites_asc
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
  end

  private
  def post_params
    params.require(:post).permit(:title, :description, :content)
  end
end
