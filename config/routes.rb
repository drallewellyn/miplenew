Rails.application.routes.draw do
  devise_for :users
  root "pages#home"

  resources :pletools
  resources :posts
  get 'tags/:tag', to: 'posts#index', as: :tag
  get '*path' => redirect('/')
end
