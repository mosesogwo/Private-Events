Rails.application.routes.draw do
  resources :events, only: [:new, :show, :create, :index]
  resources :users, only: [:new, :show, :create]
  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
