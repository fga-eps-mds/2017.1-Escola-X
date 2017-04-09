Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  # Makes alumn type and defines resources to it by using users_controller
  resources :alumns, controller: 'users', type: 'Alumn'
  root "users#index"
end
