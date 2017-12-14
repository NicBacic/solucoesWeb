Rails.application.routes.draw do
  resources :stop_times
  resources :stops
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'home#home', as: 'home' 

end
