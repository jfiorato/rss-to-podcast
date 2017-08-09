Rails.application.routes.draw do

  resources :feeds, except: [:edit, :update]
  resources :posts, only: [:index]

  root to: 'feeds#index'
end
