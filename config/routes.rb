Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'

  get '/books', to: 'books#index'

  get 'books/:id', to: 'books#show'

  get 'authors/:id', to: 'authors#show'

  get 'users/:id', to: 'users#show'

  resources :books

end
