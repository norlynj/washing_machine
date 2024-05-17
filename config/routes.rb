Rails.application.routes.draw do  
  
  devise_for :users

  devise_scope :user do
    root to: 'devise/sessions#new'
  end

  get 'dashboard', to: "landing#index", as: :landing_page
  # root 
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  resources :user_crew, :controller => 'users'
  resources :inventories
  resources :customers
  resources :transactions
  resources :analytics
  resources :orders
end
