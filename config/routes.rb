Rails.application.routes.draw do
  resources :users
  resources :products
  resources :guides
  resources :businesses
  root 'pages#home'
  get 'pages/home'
  match "tinyimgs" => "imgs#create", via: :post

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
