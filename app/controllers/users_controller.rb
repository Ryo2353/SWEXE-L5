class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    encrypted_pass = BCrypt::Password.create(params[:user][:pass])
    @user = User.new(uid: params[:user][:uid], pass: encrypted_pass)
    p = Profile.new(message: nil)
    @user.profile = p
    if @user.save
      redirect_to tweets_path, notice: "登録完了"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path, notice: "削除しました"
  end
end
