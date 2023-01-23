# 管理者用コントローラー
class Admin::HomesController < ApplicationController
  def top
    @users = User.page(params[:page])
  end
end
