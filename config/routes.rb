Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get    '/shops/signup',           to: 'shops#new'
  get    '/shops/login',            to: 'sessions#new'
  get 'password_resets/new'
  get 'password_resets/edit'
  post   '/shops/login',            to: 'sessions#create'
  delete '/shops/logout',           to: 'sessions#destroy'

  root 'products_categories#index'

  resources :account_activations,    only: [:edit]
  resources :password_resets,        only: [:new, :create, :edit, :update]
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

  get     '/search',                         to: 'products_categories#search'

  get     '/customers/login',                to: 'sessions_customers#new'
  post    '/customers/login',                to: 'sessions_customers#create'
  delete  '/customers/logout',               to: "sessions_customers#destroy"

  get '/customers/signup',                   to: 'customers#new'
  resources :customers

  get 'sessions_customers/new'
  resources :sessions_customers

  post   "cart_items/:id/add",                  to: "cart_items#add_quantity",      as: "cart_items_add"
  post   "cart_items/:id/reduce",               to: "cart_items#reduce_quantity",   as: "cart_items_reduce"
  resources :cart_items

  get 'carts/show'
  resources :carts,                    only: [:show, :destroy]
end
