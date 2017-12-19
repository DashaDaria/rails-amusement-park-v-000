Rails.application.routes.draw do
root 'welcome#home'
resources :users
resources :sessions, only: [:new, :create, :destroy]
resources :attractions
get '/signout', to: 'sessions#destroy'
get '/signin', to: 'sessions#new'
post '/ride', to: 'attractions#ride'
end
