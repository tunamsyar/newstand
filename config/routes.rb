require 'sidekiq/web'
require 'sidekiq/cron/web'

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "articles#index"

  mount Sidekiq::Web => '/sidekiq'

  resources :publishers, only: [:index, :new, :show, :create, :edit, :update] do
    member do
      get :invoke_pull
    end
  end

  resources :articles, only: [:index, :show]

  resources :error_records, only: [:index, :show] do
    member do
      post :retry
    end
  end
end
