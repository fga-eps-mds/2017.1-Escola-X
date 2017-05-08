Rails.application.routes.draw do

  get 'school_misses/index'

  get 'school_misses/show'

  get 'school_misses/new'

  get 'school_misses/create'

  get 'school_misses/edit'

  get 'school_misses/update'

  get 'school_misses/destroy'

  get 'login', to:'sessions#new', as:'login'
  post 'login', to:'sessions#create'
  get 'logout', to:'sessions#destroy', as:'logout'
  get 'users/:id/edit_password', to:'users#edit_password', as:'edit_password'

  root 'sessions#new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users
  resources :alumns
  resources :parents
  resources :notifications
  resources :secretaries
  resources :employees
  resources :teachers

  resources :parents do
  resources :alumns
  end
end
