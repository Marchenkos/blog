Rails.application.routes.draw do
  devise_for :users
  resources :home, only: [:index]

  devise_scope :user do
    authenticated :user do
      root to: 'home#index', as: :user_url
    end

    unauthenticated :user do
      root to: 'devise/sessions#new', as: :unauthenticated_root
    end
  end
end
