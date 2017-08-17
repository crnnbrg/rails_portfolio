Rails.application.routes.draw do
  devise_for :users
  resources :admins

  root to: 'projects#index'
  resources :projects do
    resources :comments
  end

  post 'verifications' => 'verifications#create'
end
