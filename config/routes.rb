Rails.application.routes.draw do
  resources :home, only: [:index]
  root to: 'home#index'

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
end
