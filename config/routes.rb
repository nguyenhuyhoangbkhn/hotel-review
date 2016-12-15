Rails.application.routes.draw do
  resources :comments
  root "hotels#index"
  resources :hotels do
    collection do
      get "search"
    end
    resources :comments
  end

  devise_for :users
  devise_for :admin_users, path: "admin/", controllers: {
    sessions: "admin/sessions",
  }

  namespace :admin do
    root "hotels#index"
    resources :villages
    resources :districts
    resources :provincials
    resources :hotels  do
      collection do
        get "search"
      end
    end
    resources :reviews, only: :update
    resources :admin_users
    resources :users
  end

  resources :reviews
  resources :users, only: [:show, :edit, :update]
end
