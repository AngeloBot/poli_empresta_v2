Rails.application.routes.draw do
  resources :tools
  resources :teams do
    resources :students
    #resources :tools
  end

  get 'signup', to: 'students#new', as: 'signup'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'home', to:  'welcome#home', as: 'home'

  resources :students
  resources :sessions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "welcome#entrance"
end
