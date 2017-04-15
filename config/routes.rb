Rails.application.routes.draw do

  # resources :sessions, only:[:new,:create,:destroy]
  resources :users
  get 'login', to:'sessions#new', as:'login'
  post 'login', to:'sessions#create'
  get 'logout', to:'sessions#destroy', as:'logout' #COMO ASSIM É UM GET?????? DELETE NAO FUNCIONA
  get 'users/:id/edit_password', to:'users#edit_password', as:'edit_password'
  resources :alumns, controller:'users', type: 'Alumn'
  resources :principals, controller:'users', type: 'Principal'

  root 'sessions#new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
