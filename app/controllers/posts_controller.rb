class PostsController < ApplicationController

  impressionist :actions => [:index, :search], :unique => [:impressionable_id, :ip_address]

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to posts_path
    end
  end

  def index
    @posts = Post.all
  end

  def search
    @selection = params[:keyword]
    @posts = Post.sort_date(@selection) || Post.sort_favorite(@selection) || Post.sort_pv(@selection)
  end

  def show
    @post = Post.find(params[:id])
    impressionist(@post, nil, :unique => [:impressionable_id, :ip_address])
  end

  def edit
  end

  private
  def post_params
    params.require(:post).permit(:title, :description, :content)
  end
end
