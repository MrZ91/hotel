HotelAdvisor::Application.routes.draw do
  devise_for :users

  resources :users, only: [:show] do
    resources :hotels, only: [:new, :create]
    root to: "users#show"
  end

  resources :hotels, only: [:show] do
    member do
      get  'rate'
    end
  end

  root to: 'home#root'
end
