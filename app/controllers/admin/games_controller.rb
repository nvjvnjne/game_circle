# 管理者用コントローラー
class Admin::GamesController < ApplicationController
  def index
    @games = Game.page(params[:page])
  end

  def show
    @game = Game.find(params[:id])
    @user = @game.user
  end

  def destroy
    game = Game.find(params[:id])
    game.destroy
    redirect_to admin_games_path(game)
  end
end
