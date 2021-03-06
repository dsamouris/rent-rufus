Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users do
    resources :bookings, only: [:index, :show]
  end

  resources :dogs do
    resources :bookings, only: [:new, :create]
  end

  resources :bookings, only: [:destroy]
end
