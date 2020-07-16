Rails.application.routes.draw do
resources :users
root 'sessions#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
