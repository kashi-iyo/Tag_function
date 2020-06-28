Rails.application.routes.draw do

  devise_for :users
  resources :users, only: [:index, :show, :edit, :update, :delete]


  #検索結果をpostsコントローラのsearchアクションへ送信
  get 'search' => 'posts#search'
  root to: 'posts#index'
  resources :posts, only: [:index, :new, :create, :show, :edit, :update] do
    resource :favorites, only: [:create, :destroy]
  end

  resources :tweets

  namespace :api, format: 'json' do
    namespace :v1 do
      resources :comments
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
