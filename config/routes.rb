Rails.application.routes.draw do

  # 会員機能(ユーザー側)
  devise_for :users, controllers: {
    registrations: 'public/registrations',
    sessions: 'public/sessions',
    passwords: 'public/passwords'
  }

  # ゲストログイン
  devise_scope :user do
    post 'users/guest_sign_in', to: 'public/sessions#guest_sign_in', as: 'guest_user_session'
  end

  # トップページ
  root to: 'public/homes#top'

  # 利用者側
  scope module: :public do
    # ユーザー実装
    resources :users, only: [:index, :show, :edit, :update]
    # ゲーム機能
    resources :games, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
      # コメント機能
      resources :comments, only: [:create, :destroy]
      # お気に入り機能
      resource :favorites, only: [:create, :destroy]
    end
  end

  # ユーザー退会機能
  get 'users/:id/unsubscribe'=>'public/users#unsubscribe', as: 'user_unsubscribe'
  patch 'users/:id/withdraw'=>'public/users#withdraw', as: 'user_withdraw'

  # ゲーム検索ページ(画像入手)
  get 'search'=>'public/games#search', as: 'game_search'



  # 会員機能(管理者側)
  devise_for :admin,skip: [:registrations, :passwords], controllers: {
    sessions: 'admin/sessions'
  }

    # 管理者トップ画面
    get '/admin'=>'admin/homes#top', as: 'admin_home'

    namespace :admin do
      # ユーザー機能
      resources :users, only: [:show]
      # ゲーム機能
      resources :games, only: [:index, :show, :destroy] do
        # コメント機能
        resources :comments, only: [:destroy]
      end
      # コメント機能(一覧画面)
      resources :comments, only: [:index]
      # ジャンル機能
      resources :genres, only: [:new, :edit, :create, :update, :destroy]
    end

    # 管理者ユーザー停止機能
    patch 'admin/users/:id/withdraw'=>'admin/users#withdraw', as: 'admin_user_withdraw'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
