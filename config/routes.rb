Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  root "users#index"

  resources :users do
    resources :applications, shallow: true #only: [:index, :new, :create]
  end
  # [:show, :edit, :update, :destroy]

  resources :sessions, only: [:new, :create, :destroy]
  resources :clubs do
    get :users, to: 'users#club_users'
  end


  get 'sign_up', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  delete 'logout', to: 'sessions#destroy', as: 'logout'
end
