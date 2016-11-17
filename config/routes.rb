Rails.application.routes.draw do

  root :to => 'bicycles#index'
  resources :bicycles
  devise_for :admins
end
