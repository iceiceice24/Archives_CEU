Rails.application.routes.draw do
  resources :users
  resources :folders
  resources :pages

  root 'folders#home'
end
