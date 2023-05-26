Rails.application.routes.draw do
  root to: 'home#index'

  resources :home, only: [:index]
  resources :account, only: [:index]
  resources :likes, only: [:update]

  resources :reviews do
    post :toggle_like, on: :member

    scope module: 'reviews' do
      resources :comments, only: [:index, :new, :create, :toggle_like]
    end
  end

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
