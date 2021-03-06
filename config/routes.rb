Rails.application.routes.draw do
#devise_for :users, path: 'account'
resources :categories
# resources :users

resources :users, only: [:show] do
  resources :recipes, only: [:show, :index]
end

resources :categories, only: [:show] do 
  resources :recipes, only: [:show, :index, :new]
end

resources :recipes, only: [:index, :show, :new, :create, :edit, :update, :destroy]

root 'recipes#index'
devise_for :users, path: 'account', controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
# # get '/signin', to: 'sessions#new', as: 'signin'
# # post '/sessions', to: 'sessions#create', as: 'sessions'
# delete '/sessions/', to: 'sessions#destroy'

# resources :recipes, except: [:index] do 
#   resources :comments
# end
# resources :users, only: [:index, :show, :edit] do 
#   resources :recipes
# end

# get '/signin', to: 'sessions#new', as: 'signin'
# post '/sessions', to: 'sessions#create', as: 'sessions'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
