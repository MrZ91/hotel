HotelAdvisor::Application.routes.draw do
  devise_for :users

  resources :users, only: [:show] do
    root to: "users#show"
  end

  resources :hotels, only: [:new, :create, :show]
  root to: 'home#root'

  post '/hotels/:id', to: 'hotels#rate'
end
