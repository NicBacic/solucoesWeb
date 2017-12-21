Rails.application.routes.draw do
  resources :stop_times
  resources :stops
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'home#home', as: 'home' 

  #post '/Login/Autenticar?token=d096d3a782f6679cd3c1677e9cc7a93c2e453af99706b97474bb85b27d84896c'

end
