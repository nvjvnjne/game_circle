# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController

  before_action :user_state, only: [:create]

  # ログイン後マイページ画面へ遷移
  def after_sign_in_path_for(resource)
    flash[:notice] = "ログイン成功！"
    user_path(current_user)
  end

  # ログアウト後ログイン画面へ遷移
  def after_sign_out_path_for(resource)
    flash[:notice] = "ログアウトしました"
    new_user_session_path
  end

  # ゲストログイン
  def guest_sign_in
    user = User.guest
    if sign_in user
      flash[:notice] = "ゲストユーザーとしてログインしました"
      redirect_to user_path(current_user)
    end
  end

  protected

  def user_state
    @user = User.find_by(email: params[:user][:email])
    return if !@user
    if @user.valid_password?(params[:user][:password]) && (@user.is_deleted == true)
      redirect_to new_user_registration_path
    end
  end

  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
