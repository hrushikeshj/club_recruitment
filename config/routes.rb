Rails.application.routes.draw do
  resources :permissions
  ActiveAdmin.routes(self)
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  root "users#index"
  get 'oauth_callback', to: "sessions#oauth_callback"

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

    member do
      get :applicant_dashboard
    end
  end
  # [:show, :edit, :update, :destroy]

  resources :sessions, only: [:new, :create, :destroy] do
    get 'via_oauth', on: :collection
  end

  resources :clubs do
    member do
      get :dashboard
      get :selected_candidates
    end
    collection do
      post :update_deadline
    end
    get :users, to: 'users#club_users'
    get :application_submissions, to: 'application_submissions#index'
  end

  get 'sign_up', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  delete 'logout', to: 'sessions#destroy', as: 'logout'
  get :all_application, to: 'applications#index'
  get :council_dashboard, to: 'clubs#council_dashboard'
  get :all_selected_candidates, to: 'clubs#all_selected_candidates'
  get :background, to: 'users#background'

  get :lock_allotment, to: 'clubs#lock_allotment'
end
