Rails.application.routes.draw do

  resources :feeds, except: [:edit, :update] do
    member do
      post :fetch
    end
  end
  resources :posts, only: [:index] do
    collection do
      get :podcast, defaults: { format: :rss }
    end
  end

  root to: 'feeds#index'
end
