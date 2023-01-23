# ユーザーページ
class Public::CommentsController < ApplicationController

  def create
    game = Game.find(params[:game_id])
    comment = current_user.comments.new(comment_params)
    comment.game_id = game.id
    if comment.save
      flash[:notice] = "コメントを送信しました"
      redirect_to game_path(game)
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    if comment.destroy
      flash[:notice] = "コメントを削除しました"
      redirect_to game_path(params[:game_id])
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
