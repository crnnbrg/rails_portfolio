Rails.application.routes.draw do
  resources :users

  root to: 'projects#index'
  resources :sessions

  resources :projects do
    resources :comments
  end
end
