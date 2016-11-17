Rails.application.routes.draw do

  get 'admin_pages/index'
  root :to => 'bicycles#index'
  resources :bicycles
  devise_for :admins
end
