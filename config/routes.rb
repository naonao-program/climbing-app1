Rails.application.routes.draw do
  devise_for :users
  root to: "top#index"

  resources :rock_information, only:[:index,:new, :create]
  resources :gym_information, only:[:index, :new, :create]
  resources :group, only:[:index]
end
