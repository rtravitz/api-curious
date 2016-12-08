Rails.application.routes.draw do
  root 'home#index'
  get '/auth/github', as: 'login'
  get '/auth/github/callback', to: 'sessions#create'
  get '/dashboard', to: 'dashboard#index'
  get '/rtravitz', to: 'profile#show', as: 'profile'
end
