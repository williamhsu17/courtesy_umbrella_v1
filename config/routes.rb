Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :umbrellas  do
    collection do
      post :borrow
    end
  end

  namespace :admin do
    resources :umbrellas
    resources :users
    resources :enterprises
    resources :stations do
      collection do
        post :return
        get :list
      end
    end
   resources :rent_histories
  end

  scope :path => '/api/v1/', :module => "api_v1", :as => 'v1', :defaults => { :format => :json } do

    post "login" => "auth#login"
    post "logout" => "auth#logout"

    resources :umbrellas do
      collection do
        post :current_status
        post :borrow
        post :return
        get :list
      end
    end
    resources :user do
      member do
        get :show_history
        get :show_last
      end
      collection do
        post :current_status
      end
    end
    resources :stations do
      collection do
      end
    end
  end

  root to: "umbrellas#index"
end
