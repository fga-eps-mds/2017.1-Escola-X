Rails.application.routes.draw do

  get 'login', to:'sessions#new', as:'login'
  post 'login', to:'sessions#create'
  get 'logout', to:'sessions#destroy', as:'logout'
  get 'alumns/:id/edit_password', to:'alumns#edit_password_alumn', as:'edit_password_alumn'
  put 'alumns/:id/edit_password', to:'alumns#update_password_alumns'
  get 'parents/:id/edit_password', to:'parents#edit_password_parent', as:'edit_password_parent'
  put 'parents/:id/edit_password', to:'parents#update_password_parent'
  get 'employees/:id/edit_password', to:'employees#edit_password_employee', as:'edit_password_employee'
  put 'employees/:id/edit_password', to:'employees#update_password_employee'
  get 'classrooms/:id/add_alumns', to:'classrooms#add_alumns', as:'add_alumns'
  post 'classrooms/:id/add_alumns', to:'classrooms#add_alumn', as:'add_alumn'
  match "/500", :to => "errors#error_500", :via => :all

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
