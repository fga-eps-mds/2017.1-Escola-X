Rails.application.routes.draw do

  get 'login', to:'sessions#new', as:'login'
  post 'login', to:'sessions#create'
  get 'logout', to:'sessions#destroy', as:'logout'
  get 'users/:id/edit_password', to:'users#edit_password', as:'edit_password'
  get 'classrooms/:id/add_alumns', to:'classrooms#add_alumns', as:'add_alumns'
  post 'classrooms/:id/add_alumns', to:'classrooms#add_alumn', as:'add_alumn'

  root 'sessions#new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users
  resources :alumns do
    resources :strikes
  end
  resources :strikes
  resources :parents
  resources :notifications
  resources :secretaries
  resources :employees
  resources :teachers
  resources :classrooms
  resources :suspensions

  resources :subjects
  resources :school_misses
  resources :alumns do
    resources :school_misses
  end

  resources :parents do
    resources :alumns
  end

  resources :alumns do
    resources :suspensions
  end
end
