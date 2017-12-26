Rails.application.routes.draw do

  resources :movies do
    collection do
      get :reviewed
    end
  end

  resources :reviews, only:[:new, :create, :edit, :update, :destroy] do
    member do
      get :corrected
    end
  end

  resources :corrections, only:[:new, :create, :edit, :update, :destroy]


  devise_for :users

  root to: "movies#index"

end
