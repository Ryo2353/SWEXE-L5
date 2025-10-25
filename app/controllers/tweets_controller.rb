class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
  end

  def new
    @tweet = Tweet.new
  end

  def create
    u = User.find_by(uid: session[:login_uid])
    @tweet = u.tweets.new(message: params[:tweet][:message])
    if @tweet.save
      redirect_to tweets_path, notice: "登録完了"
    else
      render :new
    end
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy
    redirect_to tweets_path, notice: "削除しました"
  end
end
