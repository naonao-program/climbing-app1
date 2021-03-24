Rails.application.routes.draw do
  devise_for :users
  root to: 'top#index'

  resources :rock_information, only: %i[index new create show destroy edit update] do
    collection do
      get 'search'
    end
  end
  
  resources :gym_information, only: %i[index new create show edit update]do
    collection do
      get 'search'
    end
  end

  resources :group, only: %i[index]
  resources :orders, only:[:new,:create]

  resources :rock_task, only: [:index, :new, :create]

  resources :users, only: :show
end
