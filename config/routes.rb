Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get    '/signup',           to: 'shops#new'
  get    '/login',            to: 'sessions#new'
  get 'password_resets/new'
  get 'password_resets/edit'
  post   '/login',            to: 'sessions#create'
  delete '/logout',           to: 'sessions#destroy'

  root   'shops#new'

  get '/products',             to: 'products#products'

  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :shops do
    resources :products
  end
  resources :products
end
