HotelAdvisor::Application.routes.draw do
  devise_for :users

  resources :users, only: [:show] do
    resources :hotels
    root to: "users#show"
  end

  resources :hotels, only: [:index, :show] do
    member do
      get :rate
    end
  end

  root to: 'home#root'
end
