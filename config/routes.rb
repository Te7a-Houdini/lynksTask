Rails.application.routes.draw do

  get 'admin_pages/index'
  root :to => 'bicycles#index'
  get 'bicycles/search' => 'bicycles#search'
  resources :bicycles
  resources :styles
  devise_for :admins
end
