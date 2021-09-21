Rails.application.routes.draw do
  devise_for :customers
  root to: 'homes#top'
  
  resources :items, only: [:new, :create, :index, :show, :destroy]do
    resource :favorites, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end
  
end
