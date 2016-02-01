HotelAdvisor::Application.routes.draw do
  devise_for :users
  resources :users, only: [:show] do
    resources :hotels, only: [:new, :create, :index]
    root to: "users#show"
  end

  root to: 'home#root'
end
