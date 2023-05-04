Rails.application.routes.draw do
  resources :home, only: [:index]
  resources :reviews, only: [:index, :new, :create]
  resources :account, only: [:index]

  # root to: 'home#index'

  devise_for :users,
    controllers: {
      registrations: "users/registrations",
      sessions: "users/sessions",
      passwords: "users/passwords"
    }

  devise_scope :user do
    unauthenticated :user do
      root to: 'users/sessions#new'
    end
  end

  authenticated :user do
    root 'home#index', as: :user_root
  end
end
