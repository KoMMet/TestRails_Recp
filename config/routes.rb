Rails.application.routes.draw do
  namespace :api, {format: 'json'} do
    namespace :v1 do
      resources :tusers, only: [:index, :show, :create, :update, :destroy]
      resources :trecips, only: [:index, :show]
    end
  end
  root to: 'home#index'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
