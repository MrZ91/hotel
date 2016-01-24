HotelAdvisor::Application.routes.draw do
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :hotels, only: [:new, :create, :index]
  get '/', to: 'home#root'
  get 'root', to: 'home#root'
  #get '/hotels_list', to: 'hotels#index'
  #get 'users/:id', to: 'user#profile'
  get '/signup', to: 'users#new'
  get '/signin', to: 'sessions#new'
  get '/user', to: 'sessions#new'
  get '/user/new_hotel', to: 'hotels#new'
  delete '/signout', to: 'sessions#destroy'
end
