Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'home/index'

  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :users do
    resources :addresses
  end

  root to: 'home#index'
end
