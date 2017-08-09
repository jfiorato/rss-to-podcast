Rails.application.routes.draw do

  resources :feeds, except: [:edit, :update]

  root to: 'feeds#index'
end
