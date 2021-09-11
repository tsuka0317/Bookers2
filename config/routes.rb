Rails.application.routes.draw do
  
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resources :users,only: [:show,:index,:edit,:update]
  resources :books, only: [:new, :create, :index, :show, :destroy, :edit, :update]
  resources :post_images, only: [:new, :create, :index, :show, :destroy]

  
  root to: 'homes#top'
  get 'home/about' => 'homes#about'
end
