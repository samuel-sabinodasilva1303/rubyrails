Rails.application.routes.draw do
  resources :mini_types
 get 'index/welcome'
resources :coins
  
  root to: 'index#welcome'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
