Rails.application.routes.draw do
  root to: 'access_keys#index'

  devise_for :users
  resources :users
  resources :access_keys

  namespace :api do
    namespace :v1 do
      get 'users/all'
    end
  end
end
