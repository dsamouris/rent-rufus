Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :dogs do
      resources :bookings, only: [:index, :new, :create, :show]
    end
  resources :bookings, except: [:new, :create]
end
