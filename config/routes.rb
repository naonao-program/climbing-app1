Rails.application.routes.draw do
  devise_for :users
  root to: "rock_information#index"

  resources :rock_information, only:[:new, :create]
end
