Rails.application.routes.draw do
  # トップページのルート設定
  root 'static_pages#top'

  # ユーザー登録関連のルート設定
  resources :users, only: [:new, :create]
  
  # ユーザーセッション（ログイン・ログアウト）関連のルート設定
  resources :user_sessions, only: [:new, :create, :destroy]

  # ログイン画面へのルート設定
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'

  # ログアウト処理へのルート設定
  post 'logout', to: 'user_sessions#destroy'
  delete 'logout', to: 'user_sessions#destroy'

  get "up" => "rails/health#show", as: :rails_health_check

  resources :boards, only: [:index]
end
