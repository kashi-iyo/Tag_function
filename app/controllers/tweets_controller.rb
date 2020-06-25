class TweetsController < ApplicationController

  # before_action :authenticate_user!
  #
  # def index
  #   @tweet = current_user.tweets.build
  #   @tweets = Tweet.new
  # end
  #
  # def create
  #   @tweet = current_user.tweets.new(tweet_params) if @tweet.present?
  #   Rails.logger.debug "@tweet : #{@tweet.inspect}"
  #   if @tweet.save
  #     Rails.logger.debug "@tweet : #{@tweet.inspect}"
  #     redirect_to tweets_path
  #   else
  #     render tweets_path
  #   end
  # end
  #
  # def destroy
  # end
  #
  # private
  # def tweet_params
  #   params.require(:tweet).permit(:content)
  # end

end
