Rails.application.routes.draw do
  get 'logout', to:'session#destroy', as:'logout' 
  root 'session#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
