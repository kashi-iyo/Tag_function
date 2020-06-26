class TweetsController < ApplicationController

  before_action :authenticate_user!, except: [:index]

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = current_user.tweets.new(tweet_params)
    @tweet.save
    redirect_to tweets_path
  end

  def index
    @tweet = Tweet.new
    @tweets = Tweet.all
  end

  def show
    @tweet = Tweet.find(params[:id])
  end

  private
    def tweet_params
      params.require(:tweet).permit(:body)
    end

end
