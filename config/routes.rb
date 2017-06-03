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

  get '/errors/error_500' , to:'errors#error_500'
  match "/500", :to => "errors#error_500", :via => :all

  get 'subjects/:id/add_classrooms', to:'subjects#add_classrooms', as:'add_classrooms'
  post 'subjects/:id/add_classrooms', to:'subjects#add_classroom', as:'add_classroom'
  get 'subjects/:id/show_subjects', to:'subjects#show_subjects', as:'show_subjects'


  get 'classroom/:id/classroom_subjects', to:'subjects#classroom_subjects', as:'classroom_subjects'

  get 'classroom/:id/subject/:subject_id/grades', to:'grades#set_grades', as:'set_grades'
  put 'classroom/:id/subject/:subject_id/grades', to:'grades#post_grades', as:'post_grades'


  get 'classroom/:id/subject/:subject_id/grade/:grade_id/history', to:'grade_histories#show_history', as:'show_history'
  
  root 'sessions#new'

  get 'teachers/:id/teacher_classrooms', to:'teachers#teacher_classrooms', as:'teacher_classrooms'
  get 'teachers/:teacher_id/teacher_classroom_subjects/:classroom_id', to:'teachers#teacher_classroom_subjects',
       as:'teacher_classroom_subjects'

  get 'teachers/:teacher_id/teacher_classroom_subjects/:classroom_id/teacher_grades/:subject_id', to:'teachers#teacher_grades',
       as:'teacher_grades'


  get '/alumns/:id/report', to: 'alumns#report', as: 'alumn_report'

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
