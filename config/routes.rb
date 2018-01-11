Rails.application.routes.draw do

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
    resources :corrections, only:[:new, :create, :edit, :update, :destroy]
    resources :phrases, only:[:new, :create, :edit, :update, :destroy]
  end



  resources :user_icons, only: [:new, :create, :edit, :update]

  devise_for :users

  root to: "reviews#index"

end
