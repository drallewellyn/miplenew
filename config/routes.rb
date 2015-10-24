Rails.application.routes.draw do
  devise_for :users
  root 'pages#home'
  get 'pages/home'
  resources :pletools
  resources :posts
  resources :contacts, only: [:new, :create]
  get 'pletags/:pletag', to: 'pletools#index', as: :pletag
  get 'tags/:tag', to: 'posts#index', as: :tag

end
