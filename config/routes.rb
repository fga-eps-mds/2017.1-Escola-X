Rails.application.routes.draw do

  get 'login', to:'sessions#new', as:'login'
  post 'login', to:'sessions#create'
  get 'logout', to:'sessions#destroy', as:'logout'
  get 'users/:id/edit_password', to:'users#edit_password', as:'edit_password'
  get 'classrooms/:id/add_alumns', to:'classrooms#add_alumns', as:'add_alumns'
  post 'classrooms/:id/add_alumns', to:'classrooms#add_alumn', as:'add_alumn'
  get 'subjects/:id/add_classrooms', to:'subjects#add_classrooms', as:'add_classrooms'
  post 'subjects/:id/add_classrooms', to:'subjects#add_classroom', as:'add_classroom'
  get 'subjects/:id/show_subjects', to:'subjects#show_subjects', as:'show_subjects'

  get 'classroom/:id/classroom_subjects', to:'subjects#classroom_subjects', as:'classroom_subjects'

  get 'classroom/:id/subject/:subject_id/grades', to:'grades#set_grades', as:'set_grades'
  put 'classroom/:id/subject/:subject_id/grades', to:'grades#post_grades', as:'post_grades'

  get 'teachers/:id/teacher_classrooms', to:'teachers#teacher_classrooms', as:'teacher_classrooms'
  get 'teachers/:teacher_id/teacher_classroom_subjects/:id', to:'teachers#teacher_classroom_subjects',
       as:'teacher_classroom_subjects'


  root 'sessions#new'

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
  resources :grades
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

  resources :classrooms do
    resources :subjects
  end

  resources :classrooms do
    resources :grades
  end
end
