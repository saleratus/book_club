Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'

  resources :books, only: [:index, :show, :new, :create] do
    resources :reviews, only: [:new]
  end

  resources :authors, only: [:show, :new, :create]

  resources :users, only: [:show, :new, :create]

end
