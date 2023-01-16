Rails.application.routes.draw do
  # 会員機能
  devise_for :users, controllers: {
    registrations: 'public/registrations',
    sessions: 'public/sessions',
    passwords: 'public/passwords'
  }
  # トップページ
  root to: 'public/homes#top'

  # 利用者側
  scope module: :public do
    # ユーザー実装
    resources :users, only: [:index, :show, :edit, :update]
    # ゲーム機能
    resources :games, only: [:new, :create, :show, :edit, :update, :destroy]
  end
  # ゲーム検索ページ
  get 'search'=>'public/games#search', as: 'game_search'

  # 管理者側
  devise_for :admin,skip: [:registrations, :passwords], controllers: {
    sessions: 'admin/sessions'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
