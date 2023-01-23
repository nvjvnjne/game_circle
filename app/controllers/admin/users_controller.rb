# 管理者ページ
class Admin::UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @games = @user.games.page(params[:page])
    @favorites = Favorite.where(user_id: @user)
  end
end
