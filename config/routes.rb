Rails.application.routes.draw do
  resources :tools
  resources :teams do
    resources :students
  end
  #get 'sessions/new'
  get 'signup', to: 'students#new', as: 'signup'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :students
  resources :sessions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "sessions#new"
end
