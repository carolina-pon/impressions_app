Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessopns#create'
  delete '/logout', to: 'sessions#destroy'
  
  namespace :admin do
    resources :users
  end
  
  root to: 'impressions#index'
  resources :impressions
end
