Rails.application.routes.draw do
  root to: 'home#index'

  resources :home, only: [:index]
  resources :reviews, only: [:index, :show, :new, :create]
  resources :account, only: [:index]
  resources :likes, only: [:update]


  devise_for :users,
    controllers: {
      registrations: "users/registrations",
      sessions: "users/sessions",
      passwords: "users/passwords"
    }

  authenticated :user do
    root 'home#index', as: :user_root
  end
end
