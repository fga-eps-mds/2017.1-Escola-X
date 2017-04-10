Rails.application.routes.draw do

  # resources :sessions, only:[:new,:create,:destroy]
  resources :users
  get 'login', to:'sessions#new', as:'login'
  post 'login', to:'sessions#create'
  get 'logout', to:'sessions#destroy', as:'logout' #COMO ASSIM É UM GET?????? DELETE NAO FUNCIONA
  get 'update_password/:id', to:'users#update_password', as:'update_password'


  root 'sessions#new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
