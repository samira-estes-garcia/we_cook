Rails.application.routes.draw do
resources :users, only: [:index, :show, :edit] do 
  resources :recipes
end
root 'sessions#index'
get '/signin', to: 'sessions#new', as: 'signin'
post '/sessions', to: 'sessions#create', as: 'sessions'
delete '/sessions/', to: 'sessions#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
