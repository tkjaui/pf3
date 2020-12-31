# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:index] # 非ログインユーザーのアクセス制限
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
    redirect_to users_path, alert: '不正なアクセスです。' if @user != current_user
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user), notice: '更新に成功しました'
    else
      render :edit, notice: '更新に失敗しました'
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :profile, :profile_image)
  end
end
