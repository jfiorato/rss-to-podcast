Rails.application.routes.draw do

  resources :feeds, except: [:edit, :update] do
    member do
      post :fetch
    end
  end
  resources :posts, only: [:index]

  root to: 'feeds#index'
end
