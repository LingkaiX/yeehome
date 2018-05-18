Rails.application.routes.draw do
  resources :users
  resources :products
  resources :guides
  resources :businesses
  resources :categories

  root 'pages#home'

  match "tinyimgs" => "imgs#create", via: :post
  get '/admin',   to: 'pages#admin'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  get '/:slug/:type', to: 'pages#slug2'
  get '/:slug', to: 'pages#slug'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
