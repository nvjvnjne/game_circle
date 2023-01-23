# 管理者用コントローラー
class Admin::GamesController < ApplicationController
  def index
    @games = Game.page(params[:page])
  end

  def show
    @game = Game.find(params[:id])
    @user = @game.user
  end
end
