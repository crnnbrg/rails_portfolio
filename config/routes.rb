Rails.application.routes.draw do
  resources :users
  resources :projects do
    resources :comments
  end
end
