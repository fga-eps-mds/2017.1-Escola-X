Rails.application.routes.draw do

  resources :sessions, only:[:new,:create,:destroy]
  get 'logout', to:'sessions#destroy', as:'logout'
  root 'sessions#new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
