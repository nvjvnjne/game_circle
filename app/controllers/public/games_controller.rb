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
    @game_sm_image_url = params.dig(:game, :smallImageUrl)
    @game_image_url = params.dig(:game, :largeImageUrl)
  end

  def create
    game = Game.new(game_params)
    game.user_id = current_user.id
    if game.save
      flash[:notice] = "投稿完了！"
      redirect_to game_path(game)
    end
  end

  def index
    @games = Game.order('id DESC').page(params[:page])
    if params[:search].present?
      @games = @games.where('title LIKE ?', "%#{params[:search]}%")
    end

    if params[:genre_id].present?
      @games = Game.where(genre_id: params[:genre_id]).page(params[:page])
    end
  end

  def show
    @game = Game.find(params[:id])
    @user = @game.user
    @comment = Comment.new
  end

  def edit
    @game = Game.find(params[:id])
  end

  def update
    game = Game.find(params[:id])
    if game.update(game_params)
      flash[:notice] = "編集完了！"
      redirect_to game_path(game)
    end
  end

  def destroy
    game = Game.find(params[:id])
    if game.destroy
      flash[:notice] = "投稿を1件削除しました"
      redirect_to user_path(current_user)
    end
  end

  private

  def game_params
    params.require(:game).permit(:title, :genre_id, :play_condition, :smallImageUrl, :largeImageUrl, :itemUrl, :opinion)
  end
end
