Rails.application.routes.draw do

  devise_for :users
  root to: "homes#top"
  get '/home/about' => 'homes#about', as: 'about'


  resources :books do
   resource :favorites, only: [:create, :destroy]
   resources :book_comments, only: [:create, :destroy]
  end

  resources :users do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end

  get '/search', to: 'searches#search'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
