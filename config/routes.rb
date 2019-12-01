Rails.application.routes.draw do
  #get 'sessions/new'
  get 'signup', to: 'students#_form', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :students
  resources :sessions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "students#index"
end
