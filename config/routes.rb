Busline::Application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  resources :buses
  resources :lines
  resources :about
  resources :busstops
  resources :landmarks
  resources :contact
  root to: 'home#index'
end