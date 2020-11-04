Rails.application.routes.draw do
  root to: 'impressions#index'
  resources :impressions
end
