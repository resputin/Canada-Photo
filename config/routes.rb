Rails.application.routes.draw do
  root 'static_pages#home'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :images
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :relationships
end
