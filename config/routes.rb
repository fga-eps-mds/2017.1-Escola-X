Rails.application.routes.draw do

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
  resources :school_misses

  resources :alumns do
    resources :school_misses
  end

  resources :parents do
    resources :alumns
  end
end
