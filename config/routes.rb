Rails.application.routes.draw do
  get 'pages/home'
  root 'pages#home'
  resources :pletools
  resources :posts
  devise_for :users
  resources :contacts, only: [:new, :create]
  get 'pletags/:pletag', to: 'pletools#index', as: :pletag
  get 'tags/:tag', to: 'posts#index', as: :tag

end
