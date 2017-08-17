Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'acme/registrations', sessions: 'acme/registrations', admins: 'admins' }

  root to: 'projects#index'
  resources :projects do
    resources :comments
  end

  post 'verifications' => 'verifications#create'
  put 'verifications' => 'verifications#verify'
end
