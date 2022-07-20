Rails.application.routes.draw do
  root "orders#index"

  resources :orders do
    resources :order_lists
  end

  resources :specialists
  resources :services
  resources :categories
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
