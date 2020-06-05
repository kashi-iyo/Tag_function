Rails.application.routes.draw do

  devise_for :users
  root to: 'posts#index'
  resources :posts, only: [:index, :new, :create, :show, :edit, :update] do
    resource :favorites, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
