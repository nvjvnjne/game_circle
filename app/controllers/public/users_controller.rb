class Public::UsersController < ApplicationController
  def index
    @users = User.page(params[:page])
  end

  def show
    @user = User.find(params[:id])
    @games =@user.games.page(params[:page])
    @favorites = Favorite.where(user_id: @user)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    if user.update(user_params)
      redirect_to user_path(current_user), notice: "変更完了！"
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :introduction, :fav_game, :profile_image)
  end
end
