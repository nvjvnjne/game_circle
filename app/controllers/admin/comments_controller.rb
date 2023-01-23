# 管理者用コントローラー
class Admin::CommentsController < ApplicationController

  def index
    @comments = Comment.page(params[:page])
  end

  def destroy
    comment = Comment.find(params[:id])
    if comment.destroy
      flash[:notice] = "コメントを削除しました"
      redirect_to admin_game_path(params[:game_id])
    end
  end
end
