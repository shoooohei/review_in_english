Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :movies do
    collection do
      get :reviewed
    end
  end

  resources :reviews do
    member do
      get :corrected
    end
    resources :rlikes, only: [:create, :destroy]
    resources :corrections, only:[:new, :create, :edit, :update, :destroy] do
      member do
        get :cancel
      end
      resources :clikes, only: [:create, :destroy]
    end
    resources :phrases, only:[:new, :edit, :destroy] do
      member do
        get :cancel
      end
    end
  end



  resources :user_icons, only: [:new, :create, :edit, :update]

  devise_for :users

  root to: "reviews#index"

end
