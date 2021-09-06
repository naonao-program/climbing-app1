Rails.application.routes.draw do
  devise_for :users
  root to: 'top#index'

  resources :rock_information do
    resources :rock_comments, only: :create
    resources :rock_task, only: %i[new create show destroy]
    collection do
      get 'search'
    end
  end

  resources :gym_information do
    resources :gym_comments, only: :create
    collection do
      get 'search'
    end
  end

  resources :group, only: %i[index]
  resources :orders, only: %i[new create]

  resources :users, only: :show
end
