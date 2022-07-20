Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"
  get '/homes/about' => 'homes#about', as: 'about'

  resources :books
  patch 'books/:id' => 'books#update', as: 'update_book'

  resources :users

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


end
