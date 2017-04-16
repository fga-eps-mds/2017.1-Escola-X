Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#index'

  resources :users, only: [:new, :update, :create, :destroy, :index, :show]

  # get 'index', to: 'users#index', as:'users'
  # get 'new', to:'users#new', as:'new_user'
  # post 'new', to: 'users#create'
  # get 'show', to: 'users#show',as:'user'
  # delete 'destroy', to:'users#destroy'

  get 'alumns/new' => 'users#new_alumn'
  get 'parents/new' => 'users#new_parent'

  get 'alumns/:id/edit' => 'users#edit_alumn', as: 'edit_alumn'
  get 'parents/:id/edit' => 'users#edit_parent', as: 'edit_parent'
  # Makes alumn type and defines resources to it by using users_controller
  resources :alumns, controller: 'users', type: 'Alumn'
  resources :parents, controller: 'users', type: 'Parent'

end
