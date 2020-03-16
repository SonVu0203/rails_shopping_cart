Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get    '/shops/signup',           to: 'shops#new'
  get    '/login',            to: 'sessions#new'
  get 'password_resets/new'
  get 'password_resets/edit'
  post   '/login',            to: 'sessions#create'
  delete '/logout',           to: 'sessions#destroy'

  root 'products_categories#index'

  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :shops do
    # collection do  -> new xai then nay thi se la shops/products
    member do    # -> shops/id/products
      get :products
      get :categories
    end
  end
  resources :products
  resources :categories

  resources :products_categories

  get '/search',                to: 'products_categories#search'

  get    '/users/signup',           to: 'users#new'
  resources :users
end
