Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  root "users#index"

  resources :users do
    resources :applications, shallow: true do#only: [:index, :new, :create]

      #Eg - /applications/:application_id/application_submissions/new
      resources :application_submissions, shallow: true do
        collection do
          get :edit_preference
          get :select_clubs
        end
        member do
          post :update_preference
        end
      end
    end
  end
  # [:show, :edit, :update, :destroy]

  resources :sessions, only: [:new, :create, :destroy]
  resources :clubs do
    get :users, to: 'users#club_users'
    get :application_submissions, to: 'application_submissions#index'
  end

  get 'sign_up', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  delete 'logout', to: 'sessions#destroy', as: 'logout'
end
