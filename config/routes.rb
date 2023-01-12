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
  end

  devise_for :admin,skip: [:registrations, :passwords], controllers: {
    sessions: 'admin/sessions'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
