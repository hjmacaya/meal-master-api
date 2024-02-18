Rails.application.routes.draw do
  # Nutritionists routes
  devise_for :nutritionists, path: 'nutritionists', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  }, controllers: {
    sessions: 'nutritionists/sessions',
    registrations: 'nutritionists/registrations'
  }

  # Users routes
  devise_for :users, path: 'users', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  }, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  # In bodies routes
  resources :in_bodies, only: %i[index create]

  # Nesting in_bodies routes under nutritionists
  namespace :nutritionists do
    resources :in_bodies, only: %i[index create update destroy]
  end

  # Nesting in_bodies routes under users
  namespace :users do
    resources :in_bodies, only: %i[index]
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
