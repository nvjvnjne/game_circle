class Public::GamesController < ApplicationController

  def search
    if params[:keyword]
      @keyword = params[:keyword]
      @games = RakutenWebService::Books::Game.search(title: params[:keyword])
      @game = Game.new
    end
  end

  def new
    @game = Game.new
  end

  def create
    game = Game.new(game_params)
    game.save
    redirect_to game_path
  end

  def show
    @game = Game.find(params[:id])
    @user = @game.user
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
