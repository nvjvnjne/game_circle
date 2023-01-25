# 管理者ページ
class Admin::UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @games = @user.games.page(params[:page])
    @favorites = Favorite.where(user_id: @user)
  end

  def withdraw
    @user = User.find(params[:id])
    @user.update(is_deleted: true)
    redirect_to admin_home_path
  end
end
