Rails.application.routes.draw do
  get 'reviews/create'
  get 'reviews/destroy'
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  resources :scenes do
    resources :favoris, only: [:create]
    resources :reviews, only: [:create]
  end
  resources :favoris_list, only: [:create, :show] do
    resources :scenes, only: [:create]
  end
  resources :users, only: [:show]

  namespace :my do
    resources :scenes, only: [:index]
  end

  resources :reviews, only: [:destroy]
  resources :favoris, only: [:destroy]

end
