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
  root 'users#index'

  resources :users

  # get 'index', to: 'users#index', as:'users'
  # get 'new', to:'users#new', as:'new_user'
  # post 'new', to: 'users#create'
  # get 'show', to: 'users#show',as:'user'
  # delete 'destroy', to:'users#destroy'
  resources :alumns
  resources :parents
  # get 'alumns/new' => 'alumns#new', as:'new_alumn'
  # get 'parents/new' => 'users#new_parent'

  # get 'alumns/:id/edit' => 'alumns#edit', as: 'edit_alumn'
  # get 'parents/:id/edit' => 'users#edit_parent', as: 'edit_parent'

  # get 'alumns/:id', to: 'alumns#show', as:'alumn'
  # Makes alumn type and defines resources to it by using users_controller
  # resources :alumns, controller: 'users', type: 'Alumn'

end
