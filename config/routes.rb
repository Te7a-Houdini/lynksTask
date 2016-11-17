Rails.application.routes.draw do

  get 'admin_pages/index'
  root :to => 'bicycles#index'
  resources :bicycles
  resources :styles
  devise_for :admins
end
