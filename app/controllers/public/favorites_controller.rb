class Public::FavoritesController < ApplicationController

  def create
    game = Game.find(params[:game_id])
    favorite = game.favorites.new(user_id: current_user.id)
    if favorite.save
      flash[:notice] = "お気に入り登録しました！"
      redirect_to game_path(game)
    end
  end

  def destroy
    game = Game.find(params[:game_id])
    favorite = current_user.favorites.find_by(user_id: current_user.id)
    if favorite.present?
      favorite.destroy
      flash[:notice] = "お気に入り削除しました！"
      redirect_to game_path(game)
    end
  end
end
