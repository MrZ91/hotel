HotelAdvisor::Application.routes.draw do
  get '/', to: 'home#root'
  get '/hotels_list', to: 'home#hotels_list'
end
