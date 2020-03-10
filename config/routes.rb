Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root "shops#new"
  get  '/signup',  to: 'shops#new'
  resources :shops
end
