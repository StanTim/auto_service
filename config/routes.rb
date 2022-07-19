Rails.application.routes.draw do
  resources :order_lists
  resources :orders
  resources :specialists
  resources :services
  resources :categories
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
