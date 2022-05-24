Rails.application.routes.draw do
  # get 'dogs/index'
  # get 'dogs/new'
  # get 'dogs/create'
  # get 'dogs/show'
  # get 'dogs/update'
  # get 'dogs/edit'
  # get 'dogs/destroy'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :dogs
  # do
  #   resources :bookings, only: [:new, :create, :show]
  # end
  # resources :bookings, except: [:new, :create]
end
