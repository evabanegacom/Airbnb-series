Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  namespace :api do
    # resources :users, only: :show
    get '/users_by_email' => 'users_by_emails#show', as: :users_by_email

    resources :favorites, only: %i[create destroy]
  end
  resources :properties, only: %i[show]
end
