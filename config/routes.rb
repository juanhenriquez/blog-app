Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # (HTTP Verb) 'url route', to: 'controller#action'
  root 'pages#home'
  get 'pages/about', to: 'pages#about'

  # Generate all the routes for basic CRUD.
  resources :articles

  # Signup route for user.
  get 'signup', to: 'users#new'
  resources :users, except: [:new]
  # post 'users', to: 'users#create'

  # SESSIONS
  # Sign in route for user.
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
