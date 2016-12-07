Rails.application.routes.draw do
  root 'home#index'
  get '/auth/github', as: 'login'
  get '/auth/github/callback', to: 'sessions#create'
  get '/dashboard', to: 'dashboard#index'
  get '/:nickname', to: 'profile#show'
end
