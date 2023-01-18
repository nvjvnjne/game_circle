Rails.application.routes.draw do
  # 会員機能
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
  # ゲーム検索ページ(画像入手)
  get 'search'=>'public/games#search', as: 'game_search'

  # 管理者側
  devise_for :admin,skip: [:registrations, :passwords], controllers: {
    sessions: 'admin/sessions'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
