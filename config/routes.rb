Rails.application.routes.draw do
  root to: 'home#index'

  resources :home, only: [:index]
  resources :account, only: [:index]
  resources :likes, only: [:update]

  resources :reviews, shallow: true do
    resources :comments, only: [:create, :toggle_like]
  end

  # match 'comments/:id/toggle_like' => 'comments#toggle_like', :via => :put

  resources :reviews do
    post :toggle_like, on: :member
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
