Rails.application.routes.draw do
resources :categories
resources :users

resources :users, only: [:show] do
  resources :recipes, only: [:show, :index]
end

resources :catories, only: [:show] do 
  resources :recipes, only: [:show, :index]
end

resources :recipes, only: [:index, :show, :new, :create, :edit, :update, :destroy]

root 'recipes#index'
get '/signin', to: 'sessions#new', as: 'signin'
post '/sessions', to: 'sessions#create', as: 'sessions'
delete '/sessions/', to: 'sessions#destroy'

# resources :recipes, except: [:index] do 
#   resources :comments
# end
# resources :users, only: [:index, :show, :edit] do 
#   resources :recipes
# end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
