Rails.application.routes.draw do
  devise_for :users
  root "pages#home"

  resources :pletools
  resources :posts
end
