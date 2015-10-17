Rails.application.routes.draw do
  devise_for :users
  root 'pages#home'
  get 'pages/home'
  resources :pletools
  resources :posts
  get 'tags/:tag', to: 'posts#index', as: :tag, layout: 'application'
  get 'tags/:tag', to: 'pletools#index', as: :pletag, layout: 'application'
end
