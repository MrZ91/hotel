HotelAdvisor::Application.routes.draw do
  resources :users do
    resources :hotels, only: [:new, :create, :index]
  end
  resources :sessions, only: [:new, :create, :destroy]

  get '/signup', to: 'users#new'
  get '/signin', to: 'sessions#new'
  get '/user', to: 'sessions#new'
  delete '/signout', to: 'sessions#destroy'

  get '/', to: 'home#root'
end
