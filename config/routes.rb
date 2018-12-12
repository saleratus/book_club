Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'

  resources :books, only: [:index, :show, :new, :create, :destroy] do
    resources :reviews, shallow: true, only: [:new, :create]
  end
  resources :reviews, :only => [:destroy]

  resources :authors, only: [:show, :new, :create, :destroy]

  resources :users, only: [:show, :new, :create]
end
